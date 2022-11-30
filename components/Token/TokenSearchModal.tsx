import { ChangeEvent, RefObject, useMemo, useRef, useState } from 'react'
import useDebounce from 'hooks/useDebounce'
import { ThemedText } from 'theme/presets'
import { AutoColumn, Column, Row, RowBetween } from 'components/Layouts'
import { Modal } from 'components/Modal'
import { MenuItem, SearchInput, Separator, MissingImageLogo, TokenName } from './styled'
import { CloseIcon, PaddedColumn } from '../OldToken/Search/styled'

function isValidAddress(address: string) {
  return address.startsWith('0x')
}

function TokenRow({
  token,
  isSelected,
  onSelect,
}: {
  token: TokenObject
  isSelected: boolean
  onSelect: (token: TokenObject) => void
}) {
  return (
    <MenuItem
      tabIndex={0}
      className={`token-item-${token.address}`}
      onClick={() => !isSelected && onSelect(token)}
      disabled={isSelected}
      selected={isSelected}
    >
      <Column>
        <MissingImageLogo size={'36px'}>
          {token?.symbol?.toUpperCase().replace('$', '').replace(/\s+/g, '').slice(0, 3)}
        </MissingImageLogo>
      </Column>
      <AutoColumn>
        <Row>
          <TokenName title={token.name}>{token.name}</TokenName>
        </Row>
        <ThemedText.DeprecatedDarkGray ml="0px" fontSize={'12px'} fontWeight={300}>
          {token.symbol}
        </ThemedText.DeprecatedDarkGray>
      </AutoColumn>
    </MenuItem>
  )
}

export function TokenSearchModal({
  onSelect,
  selected,
  isOpen,
  onDismiss,
}: {
  isOpen: boolean
  onDismiss: () => void
  onSelect: (token: TokenObject) => void
  selected?: TokenObject
}) {
  const [searchQuery, setSearchQuery] = useState<string>('')
  const debouncedQuery = useDebounce(searchQuery, 200)

  const inputRef = useRef<HTMLInputElement>()

  const filteredTokens = useMemo<TokenObject[]>(() => {
    if (!debouncedQuery) {
      return tokens
    }

    return tokens
      .filter((token) => {
        if (isValidAddress(debouncedQuery)) {
          return debouncedQuery.toLowerCase() === token.address
        }

        const queryParts = debouncedQuery
          .toLowerCase()
          .split(/\s+/)
          .filter((s) => s.length > 0)

        if (queryParts.length === 0) return true

        const match = (s: string): boolean => {
          const parts = s
            .toLowerCase()
            .split(/\s+/)
            .filter((s) => s.length > 0)

          return queryParts.every((p) => p.length === 0 || parts.some((sp) => sp.startsWith(p) || sp.endsWith(p)))
        }

        return ((token.symbol && match(token.symbol)) || (token.name && match(token.name))) as boolean
      })
      .slice(0, 4)
  }, [debouncedQuery])

  const handleInput = (event: ChangeEvent<HTMLInputElement>) => {
    const input = event.target.value
    setSearchQuery(input)
  }

  const handleSelect = (token: TokenObject) => {
    onSelect(token)
    onDismiss()
  }

  return (
    <Modal isOpen={isOpen} onDismiss={onDismiss}>
      <PaddedColumn gap="16px" style={{ width: '100%' }}>
        <RowBetween>
          <span style={{ fontWeight: 500, fontSize: 16 }}>
            <span>Select a token</span>
          </span>
          <CloseIcon onClick={onDismiss} />
        </RowBetween>
        <Row>
          <SearchInput
            type="text"
            id="token-search-input"
            placeholder="Search name or paste address"
            autoComplete="off"
            value={searchQuery}
            ref={inputRef as RefObject<HTMLInputElement>}
            onChange={handleInput}
          />
        </Row>
        <Separator />
        <div style={{ flex: 1 }}>
          {filteredTokens.map((token, key) => {
            const isSelected = token?.address === selected?.address
            return <TokenRow key={key} token={token} onSelect={handleSelect} isSelected={isSelected} />
          })}
        </div>
      </PaddedColumn>
    </Modal>
  )
}

export interface TokenObject {
  name: string
  symbol: string
  decimals: number
  address: string
}

const GOERLI = [
  {
    name: 'Wrapped BTC',
    symbol: 'WBTC',
    decimals: 8,
    address: '0x12d537dc323c439dc65c976fad242d5610d27cfb5f31689a0a319b8be7f3d56',
    l1_token_address: '0xC04B0d3107736C32e19F1c62b2aF67BE61d63a05',
    l2_token_address: '0x12d537dc323c439dc65c976fad242d5610d27cfb5f31689a0a319b8be7f3d56',
    l1_bridge_address: '0xf29aE3446Ce4688fCc792b232C21D1B9581E7baC',
    l2_bridge_address: '0x72eeb90833bae233a9585f2fa9afc99c187f0a3a82693becd6a4d700b37fc6b',
  },
  {
    name: 'Goerli USD Coin',
    symbol: 'USDC',
    decimals: 6,
    tags: ['stablecoin'],
    address: '0x005a643907b9a4bc6a55e9069c4fd5fd1f5c79a22470690f75556c4736e34426',
    l1_token_address: '0x07865c6e87b9f70255377e024ace6630c1eaa37f',
    l2_bridge_address: '0x001d5b64feabc8ac7c839753994f469704c6fabdd45c8fe6d26ed57b5eb79057',
    l2_token_address: '0x005a643907b9a4bc6a55e9069c4fd5fd1f5c79a22470690f75556c4736e34426',
    l1_bridge_address: '0xBA9cE9F22A3Cfa7Fcb5c31f6B2748b1e72C06204',
  },
  {
    name: 'Tether USD',
    symbol: 'USDT',
    decimals: 6,
    tags: ['stablecoin'],
    address: '0x386e8d061177f19b3b485c20e31137e6f6bc497cc635ccdfcab96fadf5add6a',
    l1_token_address: '0x509Ee0d083DdF8AC028f2a56731412edD63223B9',
    l2_token_address: '0x386e8d061177f19b3b485c20e31137e6f6bc497cc635ccdfcab96fadf5add6a',
    l1_bridge_address: '0xA1f590F18b23EFece02804704E5006E91348C997',
    l2_bridge_address: '0x71d54658ca3c6ccd84ff958adb7498b2e71ba008e29b643983221ed2bd71b69',
  },
  {
    name: 'SelfService',
    symbol: 'SLF',
    decimals: 6,
    l1_token_address: '0xd44BB808bfE43095dBb94c83077766382D63952a',
    l2_bridge_address: '0x00fd2a9843c19436542e0ac7fc7b5cbf1d0b69fc2abea6d68591e46a5ca2d75a',
    address: '0x07a39a50bf689e9430fc81fba0f4d46e245e1657e77455548ed7e32c808cfc10',
    l2_token_address: '0x07a39a50bf689e9430fc81fba0f4d46e245e1657e77455548ed7e32c808cfc10',
    l1_bridge_address: '0x160e7631f22035149A01420cADD1012267551181',
  },
  {
    name: 'Ether',
    symbol: 'ETH',
    decimals: 18,
    l1_token_address: '0x0000000000000000000000000000000000000000',
    address: '0x049d36570d4e46f48e99674bd3fcc84644ddd6b96f7c741b1562b82f9e004dc7',
    l2_token_address: '0x049d36570d4e46f48e99674bd3fcc84644ddd6b96f7c741b1562b82f9e004dc7',
    l1_bridge_address: '0xc3511006C04EF1d78af4C8E0e74Ec18A6E64Ff9e',
    l2_bridge_address: '0x073314940630fd6dcda0d772d4c972c4e0a9946bef9dabf4ef84eda8ef542b82',
  },
  {
    name: 'DAI',
    symbol: 'DAI',
    decimals: 18,
    l1_token_address: '0x11fE4B6AE13d2a6055C8D9cF65c55bac32B5d844',
    l2_bridge_address: '0x0278f24c3e74cbf7a375ec099df306289beb0605a346277d200b791a7f811a19',
    l2_token_address: '0x03e85bfbb8e2a42b7bead9e88e9a1b19dbccf661471061807292120462396ec9',
    address: '0x03e85bfbb8e2a42b7bead9e88e9a1b19dbccf661471061807292120462396ec9',
    l1_bridge_address: '0xd8beAa22894Cd33F24075459cFba287a10a104E4',
  },
]
const MAINNET = [
  {
    name: 'Wrapped BTC',
    symbol: 'WBTC',
    decimals: 8,
    l1_token_address: '0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599',
    address: '0x03fe2b97c1fd336e750087d68b9b867997fd64a2661ff3ca5a7c771641e8e7ac',
    l2_token_address: '0x03fe2b97c1fd336e750087d68b9b867997fd64a2661ff3ca5a7c771641e8e7ac',
    l1_bridge_address: '0x283751A21eafBFcD52297820D27C1f1963D9b5b4',
    l2_bridge_address: '0x07aeec4870975311a7396069033796b61cd66ed49d22a786cba12a8d76717302',
  },
  {
    name: 'USD Coin',
    symbol: 'USDC',
    decimals: 6,
    l1_token_address: '0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48',
    address: '0x053c91253bc9682c04929ca02ed00b3e423f6710d2ee7e0d5ebb06f3ecf368a8',
    l2_token_address: '0x053c91253bc9682c04929ca02ed00b3e423f6710d2ee7e0d5ebb06f3ecf368a8',
    l1_bridge_address: '0xF6080D9fbEEbcd44D89aFfBFd42F098cbFf92816',
    l2_bridge_address: '0x05cd48fccbfd8aa2773fe22c217e808319ffcc1c5a6a463f7d8fa2da48218196',
  },
  {
    name: 'Tether USD',
    symbol: 'USDT',
    decimals: 6,
    l1_token_address: '0xdAC17F958D2ee523a2206206994597C13D831ec7',
    address: '0x068f5c6a61780768455de69077e07e89787839bf8166decfbf92b645209c0fb8',
    l2_token_address: '0x068f5c6a61780768455de69077e07e89787839bf8166decfbf92b645209c0fb8',
    l1_bridge_address: '0xbb3400F107804DFB482565FF1Ec8D8aE66747605',
    l2_bridge_address: '0x074761a8d48ce002963002becc6d9c3dd8a2a05b1075d55e5967f42296f16bd0',
  },
  {
    name: 'Ether',
    symbol: 'ETH',
    decimals: 18,
    l1_token_address: '0x0000000000000000000000000000000000000000',
    address: '0x049d36570d4e46f48e99674bd3fcc84644ddd6b96f7c741b1562b82f9e004dc7',
    l2_token_address: '0x049d36570d4e46f48e99674bd3fcc84644ddd6b96f7c741b1562b82f9e004dc7',
    l1_bridge_address: '0xae0Ee0A63A2cE6BaeEFFE56e7714FB4EFE48D419',
    l2_bridge_address: '0x073314940630fd6dcda0d772d4c972c4e0a9946bef9dabf4ef84eda8ef542b82',
  },
  {
    name: 'DAI',
    symbol: 'DAI',
    decimals: 18,
    l1_token_address: '0x6B175474E89094C44Da98b954EedeAC495271d0F',
    l2_bridge_address: '0x001108cdbe5d82737b9057590adaf97d34e74b5452f0628161d237746b6fe69e',
    l2_token_address: '0x00da114221cb83fa859dbdb4c44beeaa0bb37c7537ad5ae66fe5e0efd20e6eb3',
    address: '0x00da114221cb83fa859dbdb4c44beeaa0bb37c7537ad5ae66fe5e0efd20e6eb3',
    l1_bridge_address: '0x659a00c33263d9254Fed382dE81349426C795BB6',
  },
]
const tokens: TokenObject[] = [...GOERLI, ...MAINNET]