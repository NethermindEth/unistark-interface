import "../styles/globals.css";
import type { AppProps } from "next/app";
import ThemeProvider, { ThemedGlobalStyle } from "../theme";
import { StarknetConfig, InjectedConnector } from "@starknet-react/core";

export default function App({ Component, pageProps }: AppProps) {
  const connectors = [
    new InjectedConnector({ options: { id: "braavos" } }),
    new InjectedConnector({ options: { id: "argentX" } }),
  ];
  return (
    <ThemeProvider>
      <ThemedGlobalStyle />
      <StarknetConfig connectors={connectors}>
        <Component {...pageProps} />
      </StarknetConfig>
    </ThemeProvider>
  );
}
