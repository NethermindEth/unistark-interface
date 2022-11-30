import { ReactNode, useState } from 'react'
import { Lock } from 'react-feather'
import { useTheme } from 'styled-components'
import { ThemedText } from 'theme/presets'
import {
  Aligner,
  Container,
  FiatRow,
  FixedContainer,
  InputPanel,
  InputRow,
  StyledBalanceMax,
  StyledDropDown,
  StyledNumericalInput,
  StyledTokenName,
  TokenSelect,
} from './styled'
import { AutoColumn, RowBetween, RowFixed } from 'components/Layouts'
import { LoadingOpacityContainer } from 'components/Loader/styled'
import { FiatValue } from 'components/OldToken/Input/FiatValue'
import TokenLogo from 'components/OldToken/Logo'
import TokenLogoDouble from 'components/OldToken/Logo/Double'
import TokenSearchModal from 'components/OldToken/Search/TokenSearchModal'
import { Chain, Token } from 'components/OldToken/Search/tokenAccessor'
import { isSupportedChain } from 'constants/chain'

export default function SwapTokenInputPanel({
  value,
  onUserInput,
  onMax,
  showMaxButton,
  onTokenSelect,
  selectedToken,
  id,
  showCommonBases,
  showTokenBalance = false,
  disableNonToken,
  renderBalance,
  fiatValue,
  priceImpact,
  hideBalance = false,
  pair = null, // used for double token logo
  hideInput = false,
  locked = false,
  loading = false,
  ...rest
}: {
  value: string
  onUserInput: (value: string) => void
  onMax?: () => void
  showMaxButton: boolean
  label?: ReactNode
  onTokenSelect?: (token: Token) => void
  selectedToken?: Token | null
  hideBalance?: boolean
  pair?: any | null
  hideInput?: boolean
  fiatValue?: any
  priceImpact?: any
  id: string
  showCommonBases?: boolean
  showTokenBalance?: boolean
  disableNonToken?: boolean
  renderBalance?: (amount: any) => ReactNode
  locked?: boolean
  loading?: boolean
}) {
  const theme = useTheme()
  const [modalOpen, setModalOpen] = useState<boolean>(false)

  const chainAllowed = isSupportedChain({} as Chain)
  const tokenSymbol =
    selectedToken?.symbol() && selectedToken?.symbol().length > 20
      ? selectedToken.symbol().slice(0, 4) +
        '...' +
        selectedToken.symbol().slice(selectedToken.symbol().length - 5, selectedToken.symbol().length)
      : selectedToken?.symbol()

  const selectedTokenBalance = selectedToken?.balance()
  const handleDismissSearch = () => setModalOpen(false)
  return (
    <InputPanel id={id} hideInput={hideInput} {...rest}>
      {locked && (
        <FixedContainer>
          <AutoColumn gap="sm" justify="center">
            <Lock />
            <ThemedText.DeprecatedLabel fontSize="12px" textAlign="center" padding="0 12px">
              The market price is outside your specified price range. Single-asset deposit only.
            </ThemedText.DeprecatedLabel>
          </AutoColumn>
        </FixedContainer>
      )}
      <Container hideInput={hideInput}>
        <InputRow style={hideInput ? { padding: '0', borderRadius: '8px' } : {}}>
          {!hideInput && (
            <StyledNumericalInput
              className="token-amount-input"
              value={value}
              onUserInput={onUserInput}
              disabled={!chainAllowed}
              $loading={loading}
            />
          )}

          <TokenSelect
            disabled={!chainAllowed}
            visible={!selectedToken}
            selected={selectedToken != null}
            hideInput={hideInput}
            className="open-currency-select-button"
            onClick={() => {
              if (onTokenSelect) {
                setModalOpen(true)
              }
            }}
          >
            <Aligner>
              <RowFixed>
                {pair ? (
                  <span style={{ marginRight: '0.5rem' }}>
                    <TokenLogoDouble token0={pair.token0} token1={pair.token1} size={24} margin={true} />
                  </span>
                ) : selectedToken ? (
                  <TokenLogo style={{ marginRight: '2px' }} token={selectedToken} size={'24px'} />
                ) : null}
                {pair ? (
                  <StyledTokenName className="pair-name-container">
                    {pair?.token0.symbol}:{pair?.token1.symbol}
                  </StyledTokenName>
                ) : (
                  <StyledTokenName
                    className="token-symbol-container"
                    active={Boolean(selectedToken && selectedToken.symbol())}
                  >
                    {tokenSymbol || <span>Select token</span>}
                  </StyledTokenName>
                )}
              </RowFixed>
              {onTokenSelect && <StyledDropDown selected={selectedToken != null} />}
            </Aligner>
          </TokenSelect>
        </InputRow>
        {!hideInput && !hideBalance && selectedToken && (
          <FiatRow>
            <RowBetween>
              <LoadingOpacityContainer $loading={loading}>
                <FiatValue fiatValue={fiatValue} priceImpact={priceImpact} />
              </LoadingOpacityContainer>
              {selectedTokenBalance?.isReadable() ? (
                <RowFixed style={{ height: '17px' }}>
                  <ThemedText.DeprecatedBody
                    color={theme.textSecondary}
                    fontWeight={400}
                    fontSize={14}
                    style={{ display: 'inline' }}
                  >
                    {!hideBalance && selectedTokenBalance ? (
                      renderBalance ? (
                        renderBalance(selectedTokenBalance)
                      ) : (
                        <span>Balance: {selectedTokenBalance.toCurrency(4)}</span>
                      )
                    ) : null}
                  </ThemedText.DeprecatedBody>
                  {showMaxButton && selectedTokenBalance ? (
                    <StyledBalanceMax onClick={onMax}>
                      <span>Max</span>
                    </StyledBalanceMax>
                  ) : null}
                </RowFixed>
              ) : (
                <span />
              )}
            </RowBetween>
          </FiatRow>
        )}
      </Container>
      {onTokenSelect && (
        <TokenSearchModal
          isOpen={modalOpen}
          onDismiss={handleDismissSearch}
          selectedToken={selectedToken}
          onTokenSelect={onTokenSelect}
          showTokenBalance={showTokenBalance}
        />
      )}
    </InputPanel>
  )
}
