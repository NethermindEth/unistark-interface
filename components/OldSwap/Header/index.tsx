import { RowBetween, RowFixed } from 'components/Layouts'
import { ThemedText } from 'theme/presets'
import { StyledSwapHeader } from '../styled'

export default function SwapHeader({ allowedSlippage }: { allowedSlippage: any }) {
  return (
    <StyledSwapHeader>
      <RowBetween>
        <RowFixed>
          <ThemedText.DeprecatedBlack fontWeight={500} fontSize={16} style={{ marginRight: '8px' }}>
            <span>Swap</span>
          </ThemedText.DeprecatedBlack>
        </RowFixed>
        <RowFixed>{/*<SettingsTab placeholderSlippage={allowedSlippage} />*/}</RowFixed>
      </RowBetween>
    </StyledSwapHeader>
  )
}
