import { useState } from 'react'

import { AutoColumn, Column, Row, RowFixed } from 'components/Layouts'
import { ThemedText } from 'theme/presets'
import { CheckIcon, MenuItem, StyledBalanceText, TokenName } from './styled'
import { Token } from './tokenAccessor'
import TokenLogo from '../Logo'

export function TokenList({
  isLoading,
  tokens,
  onTokenSelect,
  showTokenBalance,
  selectedToken,
}: {
  isLoading: boolean
  tokens: Token[]
  isAddressSearch?: boolean
  selectedToken?: Token | null
  showTokenBalance?: boolean
  searchQuery: string
  onTokenSelect: (token: Token) => void
}) {
  useState()
  return isLoading ? (
    <Row>Loading...</Row>
  ) : (
    <div>
      {tokens.map((token) => {
        const isSelected = (token && selectedToken && selectedToken.is(token)) as boolean

        return (
          <TokenRow
            key={token.address()}
            token={token}
            isSelected={isSelected}
            onSelect={onTokenSelect}
            showTokenBalance={showTokenBalance}
          />
        )
      })}
    </div>
  )
}

function Balance({ balance }: { balance: any }) {
  return <StyledBalanceText title={balance.toExact()}>{balance.toSignificant(4)}</StyledBalanceText>
}

export function TokenRow({
  isSelected,
  showTokenBalance,
  token,
  onSelect,
}: {
  isSelected: boolean
  showTokenBalance?: boolean
  token: Token
  onSelect: (token: Token) => void
}) {
  const tokenName = token.name()
  const balance = 0

  return (
    <MenuItem
      tabIndex={0}
      className={`token-item-${token.address()}`}
      onClick={() => (isSelected ? null : onSelect(token))}
      disabled={isSelected}
      selected={isSelected}
    >
      <Column>
        <TokenLogo token={token} size={'36px'} />
      </Column>
      <AutoColumn>
        <Row>
          <TokenName title={tokenName}>{tokenName}</TokenName>
        </Row>
        <ThemedText.DeprecatedDarkGray ml="0px" fontSize={'12px'} fontWeight={300}>
          {token.symbol()}
        </ThemedText.DeprecatedDarkGray>
      </AutoColumn>
      {showTokenBalance ? (
        <RowFixed style={{ justifySelf: 'flex-end' }}>
          {balance ? <Balance balance={balance} /> : null}
          {isSelected && <CheckIcon />}
        </RowFixed>
      ) : (
        isSelected && (
          <RowFixed style={{ justifySelf: 'flex-end' }}>
            <CheckIcon />
          </RowFixed>
        )
      )}
    </MenuItem>
  )
}
