import { useMemo } from "react";
import styled from "styled-components/macro";
import TestAbi from "../warp_output/contracts/sample__router__WC__TestRouter_abi.json";
import TestCompiled from "../warp_output/contracts/sample__router__WC__TestRouter_compiled.json";
import {
  useConnectors,
  useAccount,
  useStarknetExecute,
  useStarknetCall,
  useContract,
} from "@starknet-react/core";
import { encodeInputs, decodeOutputs } from "@nethermindeth/warp";
import {
  Abi,
  AccountInterface,
  CompiledContract,
  Contract,
  ContractFactory,
} from "starknet";

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
const contract_address =
  "0x01253023a96803ab4757ece7fc7054f642de408b5614c1c08131ceaaa48b6536";

export default function Home() {
  const { connect, available } = useConnectors();
  const { account, address, status } = useAccount();

  const { contract } = useContract({
    address: contract_address,
    abi: TestAbi as Abi,
  });

  const calls = useMemo(() => {
    // const tx = {
    //   contractAddress: contract_address,
    //   entrypoint: "getPath_d88e3e3b",
    //   calldata: [contract_address, contract_address],
    // };

    const tx2 = {
      contractAddress: contract_address,
      entrypoint: "swapTokenForToken_22894614",
      calldata: [
        contract_address,
        contract_address,
        ...toCairoUint256(200),
        contract_address,
        ...toCairoUint256(20),
      ],
    };
    return [tx2];
  }, []);

  const { data, loading, error, refresh } = useStarknetCall({
    contract,
    method: "getPath_d88e3e3b",
    args: [contract_address, contract_address],
    options: {
      watch: false,
    },
  });

  const {
    data: dataEx,
    loading: loadEx,
    error: errEx,
    execute,
  } = useStarknetExecute({ calls });

  console.log(
    data?.map((i) => i.toString()),
    loading,
    error,
    dataEx,
    loadEx,
    errEx,
    toCairoUint256(200)
  );

  // const { contractFactory } = useContractFactory({
  //   compiledContract: TestCompiled as CompiledContract,
  //   account: account as AccountInterface,
  //   classHash: "",
  // });

  // console.log(contractFactory, TestCompiled);

  // const constructorCalldata = useMemo(() => [], []);

  // const { deploy, error } = useDeploy({
  //   contractFactory,
  //   constructorCalldata,
  // });
  // console.log({ deploy });

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
        <button onClick={() => refresh()}>Call</button>
      </p>
    </PageWrapper>
  );
}
