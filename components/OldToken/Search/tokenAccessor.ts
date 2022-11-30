import { SupportedLocale } from 'constants/locales'

export interface TokenBalance {
  isReadable(): boolean
  toNumber(): number
  toFixed(decimalPlaces?: number, format?: object): string
  toCurrency(sigFigs?: number, locale?: SupportedLocale, fixedDecimals?: number): string

  notEqual(value: string): boolean
}

export interface Token {
  symbol(): string
  name(): string
  address(): string
  is(token: Token): Boolean
  logoUrl(): string
  balance(): TokenBalance
  spendable(): TokenBalance
}

export interface tokenAccessorApiAdapter {
  tokensOn(chainId: any): Promise<Token[]>
}

export interface tokenAccessorApiStore {
  tokensOn(chainId: any): Promise<Token[]>
  put(tokens: Token[]): void
}

export interface Chain {
  isValidAddress(query: string): Boolean

  id(): any

  supportGasEstimate(): boolean
}

export interface options {
  onLoadingStateChange?: (status: boolean) => void
}

export class tokenAccessor {
  private readonly adapter: tokenAccessorApiAdapter
  private readonly store: tokenAccessorApiStore
  private readonly chain: Chain
  private readonly options: options

  constructor(adapter: tokenAccessorApiAdapter, store: tokenAccessorApiStore, chain: Chain, options: options) {
    this.adapter = adapter
    this.store = store
    this.chain = chain
    this.options = options
  }

  async filter(query: string) {
    const tokens = await this.defaultTokens()

    return tokens.filter((token) => {
      if (this.chain.isValidAddress(query)) {
        return query.toLowerCase() === token.address()
      }

      const queryParts = query
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

      return Boolean((token.symbol() && match(token.symbol())) || (token.name && match(token.name())))
    })
  }

  async defaultTokens() {
    this.options.onLoadingStateChange && this.options.onLoadingStateChange(true)

    let tokens = await this.store.tokensOn(this.chain.id())

    if (tokens.length == 0) {
      tokens = await this.adapter.tokensOn(this.chain.id())
      this.store.put(tokens)
    }

    this.options.onLoadingStateChange && this.options.onLoadingStateChange(false)

    return tokens
  }
}
