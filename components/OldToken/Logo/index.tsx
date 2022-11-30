import { CSSProperties, useMemo } from 'react'
import { Token } from 'components/OldToken/Search/tokenAccessor'
import { StyledLogo } from 'components/OldToken/Search/styled'

export default function TokenLogo({
  size,
  logoUrl,
  token,
  symbol,
  style,
  ...rest
}: {
  size: string
  symbol?: string
  logoUrl?: string
  style?: CSSProperties
  token?: Token
}) {
  symbol = symbol ?? token?.symbol()
  logoUrl = logoUrl ?? token?.logoUrl()

  // Todo: implement useCurrencyLogoURIs from uniswap-interface
  const srcs = useMemo(() => (logoUrl ? [logoUrl] : []), [logoUrl])
  const props = {
    alt: `${symbol ?? 'token'} logo`,
    size,
    srcs,
    symbol,
    style,
    ...rest,
  }

  return <StyledLogo {...props} />
}
