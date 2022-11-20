import '../styles/globals.css'
import type { AppProps } from 'next/app'
import ThemeProvider, {ThemedGlobalStyle} from "../theme";

export default function App({ Component, pageProps }: AppProps) {
  return (
      <ThemeProvider>
        <ThemedGlobalStyle/>
        <Component {...pageProps} />
      </ThemeProvider>
  )
}
