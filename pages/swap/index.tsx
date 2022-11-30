import {
  ArrowContainer,
  ArrowWrapper,
  DetailsSwapSection,
  OutputSwapSection,
  PageWrapper,
  SwapCallbackError,
  SwapSection,
  SwapWrapper,
} from 'components/OldSwap/styled'
import SwapHeader from 'components/OldSwap/Header'
import SwapTokenInputPanel from 'components/OldSwap/TokenInput'
import { isSupportedChain } from 'constants/chain'
import { Chain, Token } from 'components/OldToken/Search/tokenAccessor'
import { ArrowDown, CheckCircle, HelpCircle, Loader } from 'react-feather'
import { useTheme } from 'styled-components'
import { AutoColumn, AutoRow } from 'components/Layouts'
import { ThemedText } from 'theme/presets'
import { ButtonConfirmed, ButtonError, ButtonLight, ButtonPrimary } from 'components/Form/Button'
import { GrayCard } from 'components/Layouts/Card'
import { Text } from 'rebass'
import { Field } from 'constants/swap'
import { useMemo, useState } from 'react'
import SwapDetailsDropdown from 'components/OldSwap/SwapDetailsDropdown'

export default function Swap({}: {}) {
  const theme = useTheme()

  const [showInverted, setShowInverted] = useState<boolean>(false)
  const [amounts, setAmounts] = useState<{ [field in Field]: string }>({ INPUT: '', OUTPUT: '' })
  const [tokens, setTokens] = useState<{ [field in Field]?: Token }>({})
  const [inputValue, setInputValue] = useState<String>()
  const [outputValue, setOutputValue] = useState<String>()
  const [inputToken, setInputToken] = useState<Token>()
  const [outputToken, setOutputToken] = useState<Token>()
  const [independentField, setIndependentField] = useState<Field>(Field.INPUT)
  const [approvalSubmitted, setApprovalSubmitted] = useState<boolean>(false)

  const handleTokenAmountInput = (field: Field, value: string) => {
    setIndependentField(field)
    setAmounts({ ...amounts, [field]: value })
  }
  const handleTokenChange = (field: Field, value?: Token) => {
    setTokens({ ...tokens, [field]: value })
  }

  const handleMaxInput = () => {}

  const showMaxButton = useMemo(
    () => tokens[Field.INPUT]?.spendable().notEqual(amounts[Field.INPUT]) as boolean,
    [amounts, tokens]
  )

  const routeIsLoading = useMemo(() => false, [])
  const isRouteSyncing = useMemo(() => false, [])
  const showDetailsDropdown = useMemo(() => false, [])

  const allowedSlippage = {}

  let fiatValueInput = useMemo(() => 0, [])
  let fiatValueOutput = useMemo(() => 0, [])

  const onSwitchTokens = () => {
    if (independentField === Field.INPUT) setIndependentField(Field.OUTPUT)
    else setIndependentField(Field.INPUT)
    const output = outputToken
    setOutputToken(inputToken)
    setInputToken(output)
  }

  const stableCoinPriceImpact = useMemo(() => ({}), [])

  const toggleWalletModal = () => null

  const swapIsUnsupported = useMemo(() => false, [])
  const [trade, setTrade] = useState({})
  const userHasSpecifiedInputOutput = useMemo(() => amounts && outputValue, [amounts, outputValue])
  const isExpertMode = useMemo(() => false, [])

  const blockchainIsConnected = useMemo(() => false, [])
  const routeNotFound = useMemo(() => false, [])

  const handleSwap = () => {
    if (isExpertMode) {
      handleSwap()
    } else {
      setSwapState({
        tradeToConfirm: trade,
        attemptingTxn: false,
        swapErrorMessage: undefined,
        showConfirm: true,
        txHash: undefined,
      })
    }
  }

  return (
    <PageWrapper>
      <SwapWrapper id="swap-page">
        <SwapHeader allowedSlippage={allowedSlippage} />
        <div style={{ display: 'relative' }}>
          <SwapSection>
            <SwapTokenInputPanel
              label={<span>From</span>}
              value={inputToken?.balance().toCurrency() ?? '0'}
              showMaxButton={showMaxButton}
              selectedToken={inputToken}
              onUserInput={(value) => handleTokenAmountInput(Field.INPUT, value)}
              onMax={handleMaxInput}
              fiatValue={fiatValueOutput}
              onTokenSelect={setInputToken}
              showCommonBases={true}
              id={'swap-currency-output'}
              loading={independentField === Field.OUTPUT && isRouteSyncing}
            />
          </SwapSection>
          <ArrowWrapper clickable={isSupportedChain({} as Chain)}>
            <ArrowContainer
              onClick={() => {
                setApprovalSubmitted(false) // reset 2 step UI for approvals
                onSwitchTokens()
              }}
              color={theme.textPrimary}
            >
              <ArrowDown
                size="16"
                color={inputToken && outputToken ? theme.deprecated_text1 : theme.deprecated_text3}
              />
            </ArrowContainer>
          </ArrowWrapper>
        </div>
        <AutoColumn gap={'12px'}>
          <div>
            <OutputSwapSection showDetailsDropdown={showDetailsDropdown}>
              <SwapTokenInputPanel
                value={outputValue as string}
                onUserInput={(value) => handleTokenAmountInput(Field.INPUT, value)}
                label={<span>To</span>}
                showMaxButton={false}
                hideBalance={false}
                fiatValue={fiatValueOutput ?? undefined}
                priceImpact={stableCoinPriceImpact}
                selectedToken={outputToken}
                onTokenSelect={setOutputToken}
                showCommonBases={true}
                id={'swap-currency-output'}
                loading={independentField === Field.INPUT && isRouteSyncing}
              />
            </OutputSwapSection>
            {showDetailsDropdown && (
              <DetailsSwapSection>
                <SwapDetailsDropdown
                  trade={trade}
                  syncing={isRouteSyncing}
                  loading={routeIsLoading}
                  showInverted={showInverted}
                  setShowInverted={setShowInverted}
                  allowedSlippage={allowedSlippage}
                />
              </DetailsSwapSection>
            )}
          </div>
          {/*{showPriceImpactWarning && <PriceImpactWarning priceImpact={largerPriceImpact} />}*/}
          <div>
            {swapIsUnsupported ? (
              <ButtonPrimary disabled={true}>
                <ThemedText.DeprecatedMain mb="4px">
                  <span>Unsupported Asset</span>
                </ThemedText.DeprecatedMain>
              </ButtonPrimary>
            ) : !blockchainIsConnected ? (
              <ButtonLight onClick={toggleWalletModal} fontWeight={600}>
                <span>Connect Wallet</span>
              </ButtonLight>
            ) : routeNotFound && userHasSpecifiedInputOutput && !routeIsLoading && !isRouteSyncing ? (
              <GrayCard style={{ textAlign: 'center' }}>
                <ThemedText.DeprecatedMain mb="4px">
                  <span>Insufficient liquidity for this trade.</span>
                </ThemedText.DeprecatedMain>
              </GrayCard>
            ) : (
              <ButtonError
                onClick={handleSwap}
                id="swap-button"
                disabled={!isValid || isRouteSyncing || routeIsLoading || priceImpactTooHigh || !!swapCallbackError}
                error={isValid && priceImpactSeverity > 2 && !swapCallbackError}
              >
                <Text fontSize={20} fontWeight={600}>
                  {swapInputError ? (
                    swapInputError
                  ) : isRouteSyncing || routeIsLoading ? (
                    <span>Swap</span>
                  ) : priceImpactSeverity > 2 ? (
                    <span>Swap Anyway</span>
                  ) : priceImpactTooHigh ? (
                    <span>Price Impact Too High</span>
                  ) : (
                    <span>Swap</span>
                  )}
                </Text>
              </ButtonError>
            )}
            {isExpertMode && swapErrorMessage ? <SwapCallbackError error={swapErrorMessage} /> : null}
          </div>
        </AutoColumn>
      </SwapWrapper>
    </PageWrapper>
  )
}
