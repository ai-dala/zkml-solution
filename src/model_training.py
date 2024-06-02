import pandas as pd
import numpy as np
import torch
from torch import nn
from torch.utils.data import DataLoader, TensorDataset, random_split

import os

def load_data() -> pd.DataFrame:
    current_dir = os.path.dirname(os.path.abspath('src'))
    file_path = os.path.join(current_dir, "data", "merged_data.csv")

    return pd.DataFrame(pd.read_csv(file_path))


data = load_data()


x = data[["Electricity_day_price", 'Difficulty', 'HashRate', 'Power', 'Block Reward']].values

y = data[['BTC_needed_2_months', 'BTC_needed_3_months', 'BTC_needed_4_months', 'BTC_needed_5_months', 'BTC_needed_6_months']].values

x_tensor = torch.tensor(x, dtype=torch.float32)

y_tensor = torch.tensor(y, dtype=torch.float32)

dataset = TensorDataset(x_tensor, y_tensor)

train_size = int(0.8 * len(dataset))
test_size = len(dataset) - train_size

train_dataset, test_dataset = random_split(dataset, [train_size, test_size])

train_loader = DataLoader(train_dataset, batch_size=2, shuffle=True)
test_loader = DataLoader(test_dataset, batch_size=2, shuffle=False)


class BitcoinPredictor(nn.Module):
    def __init__(self):
        super(BitcoinPredictor, self).__init__()
        self.linear = nn.Linear(5, 5)  # 2 input features to 1 output

    def forward(self, x):
        return self.linear(x)
    
model = BitcoinPredictor()

criterion = nn.MSELoss()
optimizer = torch.optim.Adam(model.parameters(), lr=0.01)

num_epochs = 100

for epoch in range(num_epochs):
    model.train()
    for X_batch, y_batch in train_loader:
        # Forward pass
        outputs = model(X_batch)
        loss = criterion(outputs, y_batch)
        
        # Backward pass and optimization
        optimizer.zero_grad()
        loss.backward()
        optimizer.step()

    # Print the loss for every epoch
    if (epoch+1) % 10 == 0:
        print(f'Epoch [{epoch+1}/{num_epochs}], Loss: {loss.item():.4f}')

model.eval()
with torch.no_grad():
    total_loss = 0
    for X_batch, y_batch in test_loader:
        outputs = model(X_batch)
        loss = criterion(outputs, y_batch)
        total_loss += loss.item()
    
    average_loss = total_loss / len(test_loader)
    print(f'Average Test Loss: {average_loss:.4f}')

    # Save model in ONNX format
    onnx_path = '/Users/aidarpochanov/repos/zkml-solution/src/model.onnx'
    torch.onnx.export(model, x_tensor, onnx_path)
    print(f'Model saved in ONNX format at: {onnx_path}')