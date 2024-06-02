use orion::numbers::{FixedTrait, FP16x16};

fn compute(ref a: Array<FP16x16>) {
a.append(FP16x16 { mag: 908, sign: false });
a.append(FP16x16 { mag: 6026, sign: false });
a.append(FP16x16 { mag: 4665, sign: true });
a.append(FP16x16 { mag: 4670, sign: true });
a.append(FP16x16 { mag: 716, sign: false });
a.append(FP16x16 { mag: 2619, sign: true });
a.append(FP16x16 { mag: 2155, sign: false });
}