/* Autogenerated file. Do not edit manually. */
/* tslint:disable */
/* eslint-disable */

import {
  ethers,
  EventFilter,
  Signer,
  BigNumber,
  BigNumberish,
  PopulatedTransaction,
} from "ethers";
import {
  Contract,
  ContractTransaction,
  Overrides,
  CallOverrides,
} from "@ethersproject/contracts";
import { BytesLike } from "@ethersproject/bytes";
import { Listener, Provider } from "@ethersproject/providers";
import { FunctionFragment, EventFragment, Result } from "@ethersproject/abi";

interface TestRouterInterface extends ethers.utils.Interface {
  functions: {
    "getPath(address,address)": FunctionFragment;
    "swapTokenForToken(address,address,uint256,address,uint256)": FunctionFragment;
  };

  encodeFunctionData(
    functionFragment: "getPath",
    values: [string, string]
  ): string;
  encodeFunctionData(
    functionFragment: "swapTokenForToken",
    values: [string, string, BigNumberish, string, BigNumberish]
  ): string;

  decodeFunctionResult(functionFragment: "getPath", data: BytesLike): Result;
  decodeFunctionResult(
    functionFragment: "swapTokenForToken",
    data: BytesLike
  ): Result;

  events: {};
}

export class TestRouter extends Contract {
  connect(signerOrProvider: Signer | Provider | string): this;
  attach(addressOrName: string): this;
  deployed(): Promise<this>;

  on(event: EventFilter | string, listener: Listener): this;
  once(event: EventFilter | string, listener: Listener): this;
  addListener(eventName: EventFilter | string, listener: Listener): this;
  removeAllListeners(eventName: EventFilter | string): this;
  removeListener(eventName: any, listener: Listener): this;

  interface: TestRouterInterface;

  functions: {
    getPath(
      _fromToken: string,
      _toToken: string,
      overrides?: CallOverrides
    ): Promise<{
      0: string[];
    }>;

    "getPath(address,address)"(
      _fromToken: string,
      _toToken: string,
      overrides?: CallOverrides
    ): Promise<{
      0: string[];
    }>;

    swapTokenForToken(
      _fromToken: string,
      _toToken: string,
      _amountIn: BigNumberish,
      _to: string,
      _maxSlippage: BigNumberish,
      overrides?: Overrides
    ): Promise<ContractTransaction>;

    "swapTokenForToken(address,address,uint256,address,uint256)"(
      _fromToken: string,
      _toToken: string,
      _amountIn: BigNumberish,
      _to: string,
      _maxSlippage: BigNumberish,
      overrides?: Overrides
    ): Promise<ContractTransaction>;
  };

  getPath(
    _fromToken: string,
    _toToken: string,
    overrides?: CallOverrides
  ): Promise<string[]>;

  "getPath(address,address)"(
    _fromToken: string,
    _toToken: string,
    overrides?: CallOverrides
  ): Promise<string[]>;

  swapTokenForToken(
    _fromToken: string,
    _toToken: string,
    _amountIn: BigNumberish,
    _to: string,
    _maxSlippage: BigNumberish,
    overrides?: Overrides
  ): Promise<ContractTransaction>;

  "swapTokenForToken(address,address,uint256,address,uint256)"(
    _fromToken: string,
    _toToken: string,
    _amountIn: BigNumberish,
    _to: string,
    _maxSlippage: BigNumberish,
    overrides?: Overrides
  ): Promise<ContractTransaction>;

  callStatic: {
    getPath(
      _fromToken: string,
      _toToken: string,
      overrides?: CallOverrides
    ): Promise<string[]>;

    "getPath(address,address)"(
      _fromToken: string,
      _toToken: string,
      overrides?: CallOverrides
    ): Promise<string[]>;

    swapTokenForToken(
      _fromToken: string,
      _toToken: string,
      _amountIn: BigNumberish,
      _to: string,
      _maxSlippage: BigNumberish,
      overrides?: CallOverrides
    ): Promise<BigNumber>;

    "swapTokenForToken(address,address,uint256,address,uint256)"(
      _fromToken: string,
      _toToken: string,
      _amountIn: BigNumberish,
      _to: string,
      _maxSlippage: BigNumberish,
      overrides?: CallOverrides
    ): Promise<BigNumber>;
  };

  filters: {};

  estimateGas: {
    getPath(
      _fromToken: string,
      _toToken: string,
      overrides?: CallOverrides
    ): Promise<BigNumber>;

    "getPath(address,address)"(
      _fromToken: string,
      _toToken: string,
      overrides?: CallOverrides
    ): Promise<BigNumber>;

    swapTokenForToken(
      _fromToken: string,
      _toToken: string,
      _amountIn: BigNumberish,
      _to: string,
      _maxSlippage: BigNumberish,
      overrides?: Overrides
    ): Promise<BigNumber>;

    "swapTokenForToken(address,address,uint256,address,uint256)"(
      _fromToken: string,
      _toToken: string,
      _amountIn: BigNumberish,
      _to: string,
      _maxSlippage: BigNumberish,
      overrides?: Overrides
    ): Promise<BigNumber>;
  };

  populateTransaction: {
    getPath(
      _fromToken: string,
      _toToken: string,
      overrides?: CallOverrides
    ): Promise<PopulatedTransaction>;

    "getPath(address,address)"(
      _fromToken: string,
      _toToken: string,
      overrides?: CallOverrides
    ): Promise<PopulatedTransaction>;

    swapTokenForToken(
      _fromToken: string,
      _toToken: string,
      _amountIn: BigNumberish,
      _to: string,
      _maxSlippage: BigNumberish,
      overrides?: Overrides
    ): Promise<PopulatedTransaction>;

    "swapTokenForToken(address,address,uint256,address,uint256)"(
      _fromToken: string,
      _toToken: string,
      _amountIn: BigNumberish,
      _to: string,
      _maxSlippage: BigNumberish,
      overrides?: Overrides
    ): Promise<PopulatedTransaction>;
  };
}