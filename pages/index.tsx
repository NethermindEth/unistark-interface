import { useMemo } from "react";
import styled from "styled-components/macro";
import TestAbi from "../warp_output/contracts/sample__router__WC__TestRouter_abi.json";
import TestCompiled from "../warp_output/contracts/sample__router__WC__TestRouter_compiled.json";
import {
  useConnectors,
  useAccount,
  useStarknetExecute,
  useContractFactory,
  useDeploy,
} from "@starknet-react/core";
import { toCairoUint256 } from "../utils/helpers";

export const PageWrapper = styled.div`
  padding: 68px 8px 0px;
  max-width: 480px;
  width: 100%;
`;

// function Component(address: string) {
//   const { contract } = useContract({
//     address: address,
//     abi: TestAbi,
//   });

//   return contract;
// }
const eg = "0x049d36570d4e46f48e99674bd3fcc84644ddd6b96f7c741b1562b82f9e004dc7";

export default function Home() {
  const { connect, available } = useConnectors();
  const { account, address, status } = useAccount();

  const calls = useMemo(() => {
    const tx = {
      contractAddress: eg,
      entrypoint: "getPath_d88e3e3b",
      calldata: [eg, eg],
    };

    const tx2 = {
      contractAddress: eg,
      entrypoint: "swapTokenForToken_22894614",
      calldata: [eg, eg, toCairoUint256(200), eg, toCairoUint256(20)],
    };
    return [tx, tx2];
  }, []);

  const { execute } = useStarknetExecute({ calls });

  const { contractFactory } = useContractFactory({
    compiledContract: TestCompiled, //eslint-disable-line no-console ts-ignore
    providerOrAccount: account,
  });

  console.log(contractFactory);

  const constructorCalldata = useMemo(() => [], [address]);

  const { deploy, error } = useDeploy({
    contractFactory,
    constructorCalldata,
  });
  console.log({ deploy });

  return (
    <PageWrapper>
      {status === "disconnected" ? (
        <div>
          <p>Disconnected, please connect to wallet now</p>
          {available.map((connector: any) => (
            <button key={connector.id()} onClick={() => connect(connector)}>
              Connect with {connector.id()}
            </button>
          ))}
        </div>
      ) : (
        <p>Account: {address}</p>
      )}
      <p>
        <button onClick={() => execute()}>Execute</button>
      </p>

      <p>
        <button onClick={() => deploy()}>Deploy</button>
      </p>
    </PageWrapper>
  );
}
