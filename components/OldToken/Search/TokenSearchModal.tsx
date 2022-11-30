import { ChangeEvent, RefObject, useEffect, useRef, useState } from 'react'
import { Text } from 'rebass'

import { Column, Row, RowBetween } from 'components/Layouts'
import { Modal } from 'components/Modal'
import useDebounce from 'hooks/useDebounce'
import { CloseIcon, ContentWrapper, PaddedColumn, SearchInput, Separator } from './styled'
import {
  Chain,
  options as tokenAccessorOptions,
  Token,
  tokenAccessor,
  tokenAccessorApiAdapter,
  tokenAccessorApiStore,
} from './tokenAccessor'
import { TokenList } from './TokenList'

function getChain(): Chain {
  return {} as Chain
}

function makeTokenAccessor(options: tokenAccessorOptions): tokenAccessor {
  return new tokenAccessor({} as tokenAccessorApiAdapter, {} as tokenAccessorApiStore, getChain(), options)
}

function useFilterTokens() {
  const [searchQuery, setSearchQuery] = useState<string>('')
  const debouncedQuery = useDebounce(searchQuery, 200)
  function handleInput(event: ChangeEvent<HTMLInputElement>) {
    const input = event.target.value
    setSearchQuery(input)
  }

  const [isLoading, setIsLoading] = useState<boolean>(false)
  const [tokens, setTokens] = useState<Token[]>([])

  const fetcher = async (query: string) => {
    let tokens
    const tokenAccessor = makeTokenAccessor({ onLoadingStateChange: setIsLoading } as tokenAccessorOptions)
    if (!query) {
      tokens = await tokenAccessor.defaultTokens()
    } else {
      tokens = await tokenAccessor.filter(query)
    }

    setTokens(tokens)
  }

  useEffect(() => {
    fetcher(debouncedQuery).catch()
  }, [debouncedQuery])

  return {
    isLoading,
    tokens,
    searchQuery,
    handleInput,
  }
}

export default function TokenSearchModal({
  isOpen,
  onDismiss,
  selectedToken,
  onTokenSelect,
  showTokenBalance,
}: {
  isOpen: boolean
  onDismiss: () => void
  selectedToken?: Token | null
  onTokenSelect: (token: Token) => void
  showTokenBalance: boolean
}) {
  const inputRef = useRef<HTMLInputElement>()
  const { tokens, isLoading, searchQuery, handleInput } = useFilterTokens()

  return (
    <Modal isOpen={isOpen} onDismiss={onDismiss}>
      <ContentWrapper>
        <PaddedColumn gap="16px">
          <RowBetween>
            <Text fontWeight={500} fontSize={16}>
              Select a token
            </Text>
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
        </PaddedColumn>
        <Separator />
        <div style={{ flex: '1' }}>
          <TokenList
            tokens={tokens}
            onTokenSelect={onTokenSelect}
            selectedToken={selectedToken}
            isLoading={isLoading}
            searchQuery={searchQuery}
            showTokenBalance={showTokenBalance}
          />
        </div>
      </ContentWrapper>
    </Modal>
  )
}
