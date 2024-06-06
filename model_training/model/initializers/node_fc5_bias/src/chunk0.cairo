use orion::numbers::{FixedTrait, FP16x16};

fn compute(ref a: Array<FP16x16>) {
a.append(FP16x16 { mag: 1411, sign: false });
a.append(FP16x16 { mag: 2155, sign: false });
a.append(FP16x16 { mag: 2947, sign: false });
a.append(FP16x16 { mag: 3777, sign: false });
a.append(FP16x16 { mag: 4664, sign: false });
}