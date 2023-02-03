import { useMemo, useState, useEffect } from "react";
import styled from "styled-components/macro";
import SwapInput from "../components/swapInput";
import { Button } from "antd";
import TestAbi from "../warp_output/contracts/sample__router__WC__TestRouter_abi.json";
//import TestCompiled from "../warp_output/contracts/sample__router__WC__TestRouter_compiled.json";
import {
  useConnectors,
  useAccount,
  useStarknetExecute,
  useStarknetCall,
  useContract,
} from "@starknet-react/core";
import { TOKENS } from "../utils/constants";
import { encodeInputs, decodeOutputs } from "@nethermindeth/warp";
import { Abi } from "starknet";

import { toCairoUint256 } from "../utils/helpers";

export const PageWrapper = styled.div`
  padding: 68px 8px 0px;
  max-width: 480px;
  width: 100%;
`;

const contract_address =
  "0x0725c1a56579ba13fbbfd0b3bcd43eb3fd4342ce0dc838ae21adbb93117275a0";

export default function Home() {
  const { connect, available } = useConnectors();
  const { account, address, status } = useAccount();
  const [callArg, setCallArg] = useState<any[]>([]);
  const [input, setInput] = useState("0.0");
  const [output, setOutput] = useState("0.0");

  const { contract } = useContract({
    address: contract_address,
    abi: TestAbi as Abi,
  });

  const { data, loading, error, refresh } = useStarknetCall({
    contract,
    method: "getPath_d88e3e3b",
    args: callArg[1],
    options: {
      watch: false,
    },
  });

  useEffect(() => {
    (async () => {
      const res = await encode(
        "../warp_output/contracts/sample__router__WC__TestRouter_abi.json",
        "getPath_d88e3e3b",
        [contract_address, contract_address]
      );
      setCallArg(res);
    })();
  }, []);

  useEffect(() => {
    (async () => {
      if (data) {
        const res = await decode(
          "../warp_output/contracts/sample__router__WC__TestRouter_abi.json",
          "getPath_d88e3e3b",
          data
        );
        setOutput(res[0]);
      }
    })();
  }, [data]);

  const encode = async (abi: string, method: string, args: any[]) => {
    return await encodeInputs(abi, method, true, args);
  };

  const decode = async (abi: string, method: string, outputs: any[]) => {
    return await decodeOutputs(abi, method, outputs);
  };

  const calls = useMemo(() => {
    const tx = {
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
    return [tx];
  }, []);

  const {
    data: dataEx,
    loading: loadEx,
    error: errEx,
    execute,
  } = useStarknetExecute({ calls });

  console.log(
    address,
    data?.map((i) => i.toString()),
    loading,
    error,
    dataEx,
    loadEx,
    errEx,
    toCairoUint256(200)
  );

  const swapToken = () => {
    if (!address) {
      console.log(available, address);
      available.slice(0, 1).map((connector: any) => connect(connector));
    } else {
      execute();
    }
  };

  return (
    <div className="h-[100vh] w-full bg-[#0e1524] flex justify-center items-center">
      <div className="bg-[#080b11] h-[450px] w-[650px] rounded-xl flex-col p-6">
        <p className="font-bold text-white text-xl mb-6">Swap</p>
        <SwapInput
          name={TOKENS[0].label}
          items={TOKENS}
          value={input}
          setValue={setInput}
        />
        <SwapInput
          name={TOKENS[1].label}
          items={TOKENS}
          value={output}
          setValue={() => {}}
        />
        <Button
          className=" border-none w-full h-[68px] rounded-2xl text-center flex justify-center items-center text-[#fff] text-2xl bg-[#4c82fb]"
          onClick={swapToken}
        >
          {!address ? "Connect Wallet" : "Swap"}
        </Button>
      </div>
    </div>
  );
}
