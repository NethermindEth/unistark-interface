import { useEffect, useState } from 'react'
import { TokenObject, TokenSearchModal } from 'components/Token/TokenSearchModal'
import { InputContainer, InputPanel, InputRow, StyledNumericalInput, TokenSelect } from './styled'
import { Aligner, StyledDropDown, StyledTokenName } from '../OldSwap/TokenInput/styled'
import { RowFixed } from 'components/Layouts'

export function SwapInput({
  hideInput = false,
  loading = false,
  id,
  onSelect,
  token,
  onUserInput,
  value = '',
  ...rest
}: {
  id: string
  value?: string
  onSelect?: (token: TokenObject) => void
  token?: TokenObject
  onUserInput: (value: string) => void
  hideInput?: boolean
  loading?: boolean
}) {
  const [openTokenModal, setOpenTokenModal] = useState<boolean>(false)
  const chainAllowed = true
  useEffect(() => console.log(token), [token])

  return (
    <InputPanel id={id} hideInput={hideInput} {...rest}>
      <InputContainer hideInput={hideInput}>
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
            visible={true}
            disabled={!chainAllowed}
            selected={token != null}
            hideInput={hideInput}
            onClick={() => onSelect && setOpenTokenModal(true)}
          >
            <Aligner>
              <RowFixed>
                <StyledTokenName className="token-symbol-container" active={token?.symbol != null}>
                  {token?.symbol || <span>Select token</span>}
                </StyledTokenName>
              </RowFixed>
              {onSelect && <StyledDropDown selected={token != null} />}
            </Aligner>
          </TokenSelect>
        </InputRow>
      </InputContainer>
      {onSelect && (
        <TokenSearchModal
          isOpen={openTokenModal}
          onDismiss={() => setOpenTokenModal(false)}
          onSelect={onSelect}
          selected={token}
        />
      )}
    </InputPanel>
  )
}
