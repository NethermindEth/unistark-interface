import { Dispatch, ReactNode, SetStateAction, useState } from 'react'
import { AutoColumn, RowFixed } from 'components/Layouts'
import { LoadingOpacityContainer } from 'components/Loader/styled'
import { ThemedText } from 'theme/presets'
import { RotatingArrow, Spinner, StyledCard, StyledHeaderRow, StyledPolling, StyledPollingDot, Wrapper } from './styled'
import { Chain } from 'components/OldToken/Search/tokenAccessor'

function TradePrice(props: {
  showInverted: boolean
  price: any
  setShowInverted: (value: ((prevState: boolean) => boolean) | boolean) => void
}) {
  return null
}

function GasEstimateBadge(props: { disableHover: any; trade: any; showRoute: boolean; loading: boolean }) {
  return null
}

function AdvancedSwapDetails(props: { trade: any; allowedSlippage: any; syncing: boolean }) {
  return null
}

function AnimatedDropdown(props: { open: any; children: ReactNode }) {
  return null
}

function SwapRoute(props: { trade: any; syncing: boolean }) {
  return null
}

export default function SwapDetailsDropdown({
  trade,
  syncing,
  loading,
  showInverted,
  setShowInverted,
  allowedSlippage,
}: {
  trade: any | undefined
  syncing: boolean
  loading: boolean
  showInverted: boolean
  setShowInverted: Dispatch<SetStateAction<boolean>>
  allowedSlippage: any
}) {
  const [showDetails, setShowDetails] = useState<boolean>(false)

  const chain: Chain = {} as Chain
  return (
    <Wrapper style={{ marginTop: '0' }}>
      <AutoColumn gap="8px" style={{ width: '100%', marginBottom: '-8px' }}>
        <StyledHeaderRow onClick={() => setShowDetails(!showDetails)} disabled={!trade} open={showDetails}>
          <RowFixed style={{ position: 'relative' }}>
            {loading || syncing ? (
              <StyledPolling>
                <StyledPollingDot>
                  <Spinner />
                </StyledPollingDot>
              </StyledPolling>
            ) : (
              <span>
                {/*<HideSmall>
                <MouseoverTooltipContent
                  wrap={false}
                  content={
                    <ResponsiveTooltipContainer origin="top right" style={{ padding: '0' }}>
                      <Card padding="12px">
                        <AdvancedSwapDetails
                          trade={trade}
                          allowedSlippage={allowedSlippage}
                          syncing={syncing}
                          hideInfoTooltips={true}
                        />
                      </Card>
                    </ResponsiveTooltipContainer>
                  }
                  placement="bottom"
                  disableHover={showDetails}
                >
                  <StyledInfoIcon color={trade ? theme.deprecated_text3 : theme.deprecated_bg3} />
                </MouseoverTooltipContent>
              </HideSmall>*/}
              </span>
            )}
            {trade ? (
              <LoadingOpacityContainer $loading={syncing}>
                <TradePrice
                  price={trade.executionPrice}
                  showInverted={showInverted}
                  setShowInverted={setShowInverted}
                />
              </LoadingOpacityContainer>
            ) : loading || syncing ? (
              <ThemedText.DeprecatedMain fontSize={14}>
                <span>Fetching best price...</span>
              </ThemedText.DeprecatedMain>
            ) : null}
          </RowFixed>
          <RowFixed>
            {!trade?.gasUseEstimateUSD || showDetails || !chain || !chain.supportGasEstimate() ? null : (
              <GasEstimateBadge
                trade={trade}
                loading={syncing || loading}
                showRoute={!showDetails}
                disableHover={showDetails}
              />
            )}
            <RotatingArrow trade={trade} open={Boolean(trade && showDetails)} />
          </RowFixed>
        </StyledHeaderRow>
        <AnimatedDropdown open={showDetails}>
          <AutoColumn gap="8px" style={{ padding: '0', paddingBottom: '8px' }}>
            {trade ? (
              <StyledCard>
                <AdvancedSwapDetails trade={trade} allowedSlippage={allowedSlippage} syncing={syncing} />
              </StyledCard>
            ) : null}
            {trade ? <SwapRoute trade={trade} syncing={syncing} /> : null}
          </AutoColumn>
        </AnimatedDropdown>
      </AutoColumn>
    </Wrapper>
  )
}
