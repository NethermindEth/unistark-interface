import { useMemo } from 'react'
import { useTheme } from 'styled-components'

import { ThemedText } from 'theme/presets'
// import { warningSeverity } from 'utils/prices'
import { TokenBalance } from '../Search/tokenAccessor'

export function FiatValue({
  fiatValue,
  priceImpact,
}: {
  fiatValue: TokenBalance | null | undefined
  priceImpact?: any
}) {
  const theme = useTheme()
  const priceImpactColor = useMemo(() => {
    if (!priceImpact) return undefined
    if (priceImpact.lessThan('0')) return theme.deprecated_green1

    function warningSeverity(priceImpact: any) {
      return 0
    }

    const severity = warningSeverity(priceImpact)
    if (severity < 1) return theme.deprecated_text3
    if (severity < 3) return theme.deprecated_yellow1
    return theme.deprecated_red1
  }, [priceImpact, theme.deprecated_green1, theme.deprecated_red1, theme.deprecated_text3, theme.deprecated_yellow1])

  const p = Number(fiatValue?.toFixed())
  const visibleDecimalPlaces = p < 1.05 ? 4 : 2

  return (
    <ThemedText.DeprecatedBody fontSize={14} color={theme.textSecondary}>
      {fiatValue && <>${fiatValue?.toFixed(visibleDecimalPlaces, { groupSeparator: ',' })}</>}
      {priceImpact ? (
        <span style={{ color: priceImpactColor }}>
          {' '}
          <span title={`The estimated difference between the USD values of input and output amounts.`}>
            (<span>{priceImpact.multiply(-1).toSignificant(3)}%</span>)
          </span>
        </span>
      ) : null}
    </ThemedText.DeprecatedBody>
  )
}
