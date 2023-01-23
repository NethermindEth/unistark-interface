export function toCairoUint256(val: number | bigint): [string, string] {
  val = BigInt(val);
  const low = val & ((1n << 128n) - 1n);
  const high = val >> 128n;
  return [low.toString(), high.toString()];
}

export function toCairoInt256(val: number | bigint): [string, string] {
  return toCairoUint256(BigInt.asUintN(256, BigInt(val)));
}

export const toCairoInt8 = (val: number | bigint) =>
  BigInt.asUintN(8, BigInt(val)).toString();
