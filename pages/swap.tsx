import { useMemo, useState, useEffect } from "react";
import styled from "styled-components/macro";
import SwapInput from "../components/swapInput";
import { Button } from "antd";
import TestAbi from "../warp_output/contracts/sample__router__WC__TestRouter_abi.json";
import TestABI from "../artifacts/contracts/sample_router.sol/TestRouter.json";
//import TestCompiled from "../warp_output/contracts/sample__router__WC__TestRouter_compiled.json";
import {
  useConnectors,
  useAccount,
  useStarknetExecute,
  useStarknetCall,
  useContract,
} from "@starknet-react/core";
import { TOKENS } from "../utils/constants";
import { encodeInputs } from "../transcode/encode";
import { decodeOutputs } from "../transcode/decode";
import { Abi } from "starknet";

export const PageWrapper = styled.div`
  padding: 68px 8px 0px;
  max-width: 480px;
  width: 100%;
`;

const contract_address =
  "0x01253023a96803ab4757ece7fc7054f642de408b5614c1c08131ceaaa48b6536"; //"0x0725c1a56579ba13fbbfd0b3bcd43eb3fd4342ce0dc838ae21adbb93117275a0";

export default function Home() {
  const { connect, available } = useConnectors();
  const { account, address, status } = useAccount();
  const [callArg, setCallArg] = useState<any[]>([]);
  const [input, setInput] = useState("");
  const [output, setOutput] = useState("0.0");
  const [swapInputCalldata, setSwapInputCalldata] = useState<string[]>([]);

  const { contract } = useContract({
    address: contract_address,
    abi: TestAbi as Abi,
  });

  // useEffect(() => {
  //   (async () => {
  //     if (address) {
  //       const res = await encode(TestABI.abi, "getPath", [
  //         contract_address,
  //         contract_address,
  //       ]);
  //       setCallArg(res);
  //     }
  //   })();
  // }, [address]);

  useEffect(() => {
    (async () => {
      if (address && Number(input) > 0) {
        const res = await encode(TestABI.abi, "swapTokenForToken", [
          contract_address,
          contract_address,
          input,
          contract_address,
          20,
        ]);
        setSwapInputCalldata(res[1]);
      }

      const res = await encode(TestABI.abi, "getAmountOut", [
        "0",
        [contract_address, contract_address],
      ]);
      setCallArg(res);
    })();
  }, [input, address]);

  const calls = useMemo(() => {
    if (swapInputCalldata.length > 0) {
      const tx = {
        contractAddress: contract_address,
        entrypoint: "swapTokenForToken_22894614",
        calldata: swapInputCalldata,
      };
      return [tx];
    }
  }, [swapInputCalldata]);

  const { data, loading, error, refresh } = useStarknetCall({
    contract,
    method: callArg[0],
    args: [
      [callArg[1]?.[0], callArg[1]?.[1]],
      [callArg[1]?.[2]],
      callArg[1]?.slice(3),
    ],
    options: {
      watch: true,
    },
  });

  const {
    data: dataEx,
    loading: loadEx,
    error: errEx,
    execute,
  } = useStarknetExecute({ calls });

  useEffect(() => {
    (async () => {
      if (data) {
        try {
          const output = [data[0].high + "", data[0].low + ""].reduce(
            (a, b) => Number(a) + Number(b),
            0
          );
          console.log(output);
          const res = await decode(TestABI.abi, "getAmountOut", [output]);
          console.log("dec", { res });
          setOutput(res[0]);
        } catch (e) {
          console.log(e);
        }
      }
    })();
  }, [data]);

  const encode = async (abi: any, method: string, args: any[]) => {
    return await encodeInputs(abi, method, false, args);
  };

  const decode = async (abi: any, method: string, outputs: any[]) => {
    return await decodeOutputs(abi, method, outputs);
  };

  const updateInput = async (input: string) => {
    if (Number(input) > 0) {
      setInput(input);
      const res = await encode(TestABI.abi, "getAmountOut", [
        input,
        [contract_address, contract_address],
      ]);
      console.log("enc", { res });
      setCallArg(res);
      setTimeout(() => {
        refresh();
      }, 1000);
    }
  };

  const swapToken = () => {
    if (!address) {
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
          setValue={updateInput}
          disableInput={false}
        />
        <SwapInput
          name={TOKENS[1].label}
          items={TOKENS}
          value={output}
          setValue={() => {}}
          disableInput
        />
        <Button
          className=" border-none w-full h-[68px] rounded-2xl text-center flex justify-center items-center text-[#fff] text-2xl bg-[#4c82fb]"
          onClick={swapToken}
          loading={loading || loadEx}
        >
          {!address ? "Connect Wallet" : "Swap"}
        </Button>
      </div>
    </div>
  );
}
