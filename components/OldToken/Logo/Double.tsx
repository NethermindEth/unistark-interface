import styled from 'styled-components'
import TokenLogo from 'components/OldToken/Logo'
import { Token } from 'components/OldToken/Search/tokenAccessor'

const Wrapper = styled.div<{ margin: boolean; sizeraw: number }>`
  position: relative;
  display: flex;
  flex-direction: row;
  margin-left: ${({ sizeraw, margin }) => margin && (sizeraw / 3 + 8).toString() + 'px'};
`

interface DoubleTokenLogoProps {
  margin?: boolean
  size?: number
  token0?: Token
  token1?: Token
}

const HigherLogo = styled(TokenLogo)`
  z-index: 1;
`
const CoveredLogo = styled(TokenLogo)<{ sizeraw: number }>`
  position: absolute;
  left: ${({ sizeraw }) => '-' + (sizeraw / 2).toString() + 'px'} !important;
`

export default function DoubleTokenLogo({ token0, token1, size = 16, margin = false }: DoubleTokenLogoProps) {
  return (
    <Wrapper sizeraw={size} margin={margin}>
      {token0 && <HigherLogo token={token0} size={size.toString() + 'px'} />}
      {token1 && <CoveredLogo token={token1} size={size.toString() + 'px'} sizeraw={size} />}
    </Wrapper>
  )
}
