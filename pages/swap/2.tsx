import { useCallback, useState } from 'react'
import styled, { useTheme } from 'styled-components'
import DefaultLayout from 'layout/Default'
import { TokenObject } from 'components/Token/TokenSearchModal'
import { SwapInput } from 'components/Swap/Input'
import {
  ArrowContainer,
  ArrowWrapper,
  OutputSwapSection,
  PageWrapper,
  SwapSection,
  SwapWrapper,
} from 'components/OldSwap/styled'
import SwapHeader from 'components/OldSwap/Header'
import { ArrowDown } from 'react-feather'
import { ButtonError, ButtonLight, ButtonPrimary } from 'components/Form/Button'
import { ThemedText } from 'theme/presets'
import { GrayCard } from 'components/Layouts'
import { ethers } from 'ethers'

export const Column = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
`

export const AutoColumn = styled.div<{
  gap?: 'sm' | 'md' | 'lg' | string
  justify?: 'stretch' | 'center' | 'start' | 'end' | 'flex-start' | 'flex-end' | 'space-between'
}>`
  display: grid;
  grid-auto-rows: auto;
  grid-row-gap: ${({ gap }) => (gap === 'sm' && '8px') || (gap === 'md' && '12px') || (gap === 'lg' && '24px') || gap};
  justify-items: ${({ justify }) => justify && justify};
`

export const Row = styled.div<{
  width?: string
  align?: string
  justify?: string
  padding?: string
  border?: string
  borderRadius?: string
}>`
  width: ${({ width }) => width ?? '100%'};
  display: flex;
  padding: 0;
  align-items: ${({ align }) => align ?? 'center'};
  justify-content: ${({ justify }) => justify ?? 'flex-start'};
  padding: ${({ padding }) => padding};
  border: ${({ border }) => border};
  border-radius: ${({ borderRadius }) => borderRadius};
`

enum Field {
  Input = 'input',
  Output = 'output',
}

export default function Swap2() {
  const theme = useTheme()
  const { amounts, tokens, independentField, handleTokenSelect, handleUserInput, handleSwitchTokens, handleSwap } =
    useSwap()

  return (
    <DefaultLayout>
      <PageWrapper>
        <SwapWrapper id="swap-page">
          <SwapHeader allowedSlippage={{}} />

          <div style={{ display: 'relative' }}>
            <SwapSection>
              <SwapInput
                id={'test'}
                onSelect={(token) => handleTokenSelect(Field.Input, token)}
                onUserInput={(amount) => handleUserInput(Field.Input, amount)}
                value={amounts[Field.Input]}
                token={tokens[Field.Input]}
              />
            </SwapSection>
            <ArrowWrapper clickable={true}>
              <ArrowContainer onClick={handleSwitchTokens} color={theme?.textPrimary}>
                <ArrowDown
                  size="16"
                  color={
                    tokens[Field.Input] && tokens[Field.Output] ? theme?.deprecated_text1 : theme?.deprecated_text3
                  }
                />
              </ArrowContainer>
            </ArrowWrapper>
            <AutoColumn gap={'12px'}>
              <div>
                <OutputSwapSection showDetailsDropdown={false}>
                  <SwapInput
                    value={amounts[Field.Output]}
                    onUserInput={(value) => handleUserInput(Field.Output, value)}
                    token={tokens[Field.Output]}
                    onSelect={(token) => handleTokenSelect(Field.Output, token)}
                    id={'swap-currency-output'}
                    loading={independentField === Field.Output && false}
                  />
                </OutputSwapSection>
                <SwapAction onSwap={handleSwap} />
              </div>
            </AutoColumn>
          </div>
        </SwapWrapper>
      </PageWrapper>
    </DefaultLayout>
  )
}

enum SwapError {
  Unsupported,
  BlockchainNotConnected,
  InputError,
  RouteNotFound,
  Unknown,
}

function SwapAction({
  isRouteSyncing = false,
  isRouteLoading = false,
  swapError,
  swapInputErrorMessage,
  onSwap,
}: {
  isRouteSyncing?: boolean
  isRouteLoading?: boolean
  swapError?: SwapError
  swapInputErrorMessage?: string
  onSwap: () => void
}) {
  const toggleWalletModal = () => null
  let action

  if (swapError === SwapError.Unsupported) {
    action = (
      <ButtonPrimary disabled={true}>
        <ThemedText.DeprecatedMain mb="4px">
          <span>Unsupported Asset</span>
        </ThemedText.DeprecatedMain>
      </ButtonPrimary>
    )
  } else if (swapError === SwapError.RouteNotFound) {
    action = (
      <GrayCard style={{ textAlign: 'center' }}>
        <ThemedText.DeprecatedMain mb="4px">
          <span>Insufficient liquidity for this trade.</span>
        </ThemedText.DeprecatedMain>
      </GrayCard>
    )
  } else if (swapError === SwapError.BlockchainNotConnected) {
    action = (
      <ButtonLight onClick={toggleWalletModal}>
        <span>Connect Wallet</span>
      </ButtonLight>
    )
  } else {
    action = (
      <ButtonError onClick={onSwap} id="swap-button" disabled={swapError == null || isRouteSyncing || isRouteLoading}>
        <span style={{ fontSize: '20px', fontWeight: 600 }}>
          {swapError === SwapError.InputError ? swapInputErrorMessage : <span>Swap</span>}
        </span>
      </ButtonError>
    )
  }
  return <div>{action}</div>
}

function useSwap() {
  const [independentField, setIndependentField] = useState<Field>(Field.Input)
  const [amounts, setAmounts] = useState<{ [field in Field]: string }>({ input: '', output: '' })
  const [tokens, setTokens] = useState<{ [field in Field]?: TokenObject }>({})

  const handleTokenSelect = (field: Field, token?: TokenObject) => {
    setTokens({ ...tokens, [field]: token })
  }
  const handleUserInput = (field: Field, amount: string) => {
    setIndependentField(field)
    setAmounts({ ...amounts, [field]: amount })
  }

  const handleSwitchTokens = () => {
    if (independentField === Field.Input) setIndependentField(Field.Output)
    else setIndependentField(Field.Input)

    const input = tokens[Field.Input]
    const output = tokens[Field.Output]

    handleTokenSelect(Field.Output, input)
    handleTokenSelect(Field.Input, output)
  }

  const handleSwap = () => {}

  return {
    amounts,
    tokens,
    independentField,
    handleTokenSelect,
    handleUserInput,
    handleSwitchTokens,
    handleSwap,
  }
}

async function useAutoRoute() {
  const { tokens, amounts, handleUserInput } = useSwap()

  const provider = new ethers.providers.JsonRpcProvider(
    'https://starknet-goerli.infura.io/v3/be68cf1381d2450e97049723341ce1a4'
  )
  const abi = [
    { inputs: [{ name: '_name', type: 'felt' }], name: 'storeName', outputs: [], type: 'function' },
    {
      inputs: [{ name: '_address', type: 'felt' }],
      name: 'getName',
      outputs: [{ name: 'name', type: 'felt' }],
      stateMutability: 'view',
      type: 'function',
    },
  ]

  const contract = new ethers.Contract(
    '0x049e5c0e9fbb072d7f908e77e117c76d026b8daf9720fe1d74fa3309645eabce',
    abi,
    provider
  )
  const tx = await contract.getName()
  await tx.wait()
}
