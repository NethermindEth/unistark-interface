import { BigNumberish } from "ethers";
import { ParamType, Result } from "ethers/lib/utils";
import { readFileSync } from "fs";

export type SolValue =
  | BigNumberish
  | boolean
  | string
  | { [key: string]: SolValue }
  | SolValue[];
export type Param = (string | number | Param)[];

export type SolParamType = { internalType: string; name: string; type: string };
export type SolFuncType = {
  inputs: SolParamType[];
  name: string;
  outputs: SolParamType[];
  stateMutability: "payable" | "pure" | "view";
  type: "function";
};

export type SolConstructorType = {
  inputs: SolParamType[];
  stateMutability: "payable" | "pure" | "view";
  type: "constructor";
};

export type SolABIFunction = SolFuncType | SolConstructorType;

export function parseSolAbi(filePath: string): [] {
  const abiString = readFileSync(filePath, "utf-8");
  const solAbi = JSON.parse(abiString);
  return solAbi;
}

export function divmod(x: bigint, y: bigint): [bigint, bigint] {
  const div = BigInt(x / y);
  const rem = BigInt(x % y);
  return [div, rem];
}

export async function selectSignature(
  abi: SolABIFunction[],
  funcName: string
): Promise<SolABIFunction> {
  if (funcName === "constructor") {
    // Item with abi[type] === 'constructor'
    const constructorsAbi = abi.filter(
      (item: SolABIFunction) => item.type === "constructor"
    );
    if (constructorsAbi.length === 0) {
      // Solidity ABI has no constructor so enforce empty args for constructor in CLI
      return {
        inputs: [],
        stateMutability: "view",
        type: "constructor",
      };
    }
    if (constructorsAbi.length > 1) {
      throw new Error("Multiple constructors found in abi");
    }
    return {
      type: "function",
      inputs: constructorsAbi[0].inputs,
      outputs: [],
      stateMutability: constructorsAbi[0].stateMutability,
      name: "constructor",
    };
  }

  const matchesWithoutConstructor = abi.filter(
    (item: SolABIFunction) => item.type === "function"
  ) as SolFuncType[];
  const matches = matchesWithoutConstructor.filter(
    (fs: SolFuncType) => fs["name"] === funcName
  );

  if (!matches.length) {
    throw new Error(`No function in abi with name ${funcName}`);
  }

  return matches[0];

  // const choice = await prompts({
  //   type: "select",
  //   name: "func",
  //   message: `Multiple function definitions found for ${funcName}. Please select one now:`,
  //   choices: matches.map((func) => ({ title: func.name, value: func })),
  // });

  // return choice.func;
}

export function isPrimitiveParam(type: ParamType): boolean {
  return type.arrayLength === null && type.components === null;
}

const uint128 = BigInt("0x100000000000000000000000000000000");

export function toUintOrFelt(value: bigint, nBits: number): bigint[] {
  const val = bigintToTwosComplement(BigInt(value.toString()), nBits);
  if (nBits > 251) {
    const [high, low] = divmod(val, uint128);
    return [low, high];
  } else {
    return [val];
  }
}

export function bigintToTwosComplement(val: bigint, width: number): bigint {
  if (val >= 0n) {
    // Non-negative values just need to be truncated to the given bitWidth
    const bits = val.toString(2);
    return BigInt(`0b${bits.slice(-width)}`);
  } else {
    // Negative values need to be converted to two's complement
    // This is done by flipping the bits, adding one, and truncating
    const absBits = (-val).toString(2);
    const allBits = `${"0".repeat(
      Math.max(width - absBits.length, 0)
    )}${absBits}`;
    const inverted = `0b${[...allBits]
      .map((c) => (c === "0" ? "1" : "0"))
      .join("")}`;
    const twosComplement = (BigInt(inverted) + 1n).toString(2).slice(-width);
    return BigInt(`0b${twosComplement}`);
  }
}

export function twosComplementToBigInt(val: bigint, width: number): bigint {
  const mask = 2n ** BigInt(width) - 1n;
  const max = 2n ** BigInt(width - 1) - 1n;
  if (val > max) {
    // Negative number
    const pos = (val ^ mask) + 1n;
    return -pos;
  } else {
    // Positive numbers as are
    return val;
  }
}

export function safeNext<T>(iter: IterableIterator<T>): T {
  const next = iter.next();
  if (!next.done) {
    return next.value;
  }
  throw new Error("Unexpected end of input in Solidity to Cairo encode");
}

export function normalizeAddress(address: string): string {
  // For some reason starknet-devnet does not zero pads their addresses
  // For some reason starknet zero pads their addresses
  return `0x${address.split("x")[1].padStart(64, "0")}`;
}
