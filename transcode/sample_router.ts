import { BigNumber } from "ethers";
import { ethers } from "hardhat";
import { TestRouter } from "../typechain";

// const TEST_ADDRESSES: [string, string] = [
//   "0x0000000000000000000000001000000000000000000000000000000000000000",
//   "0x0000000000000000000000002000000000000000000000000000000000000000",
// ];
//TEST_ADDRESSES[0], TEST_ADDRESSES[1]
export async function SampleRouter() {
  let router: TestRouter;
  const routerFactory = await ethers.getContractFactory("TestRouter");
  router = (await routerFactory.deploy()) as TestRouter;

  async function getRoutePath(_fromToken: string, _toToken: string) {
    console.log(routerFactory, router);
    return await router.getPath(_fromToken, _toToken);
  }

  async function swapTokens(
    _fromToken: string,
    _toToken: string,
    _amountIn: BigNumber,
    _to: string,
    _maxSlippage: BigNumber
  ) {
    console.log(routerFactory, router);
    return await router.swapTokenForToken(
      _fromToken,
      _toToken,
      _amountIn,
      _to,
      _maxSlippage
    );
  }

  return { getRoutePath, swapTokens };
}
