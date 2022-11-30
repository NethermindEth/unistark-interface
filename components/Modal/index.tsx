import { DialogContent, DialogOverlay } from '@reach/dialog'
import styled, { css } from 'styled-components'
import { ReactNode, RefObject } from 'react'

const StyledDialogOverlay = styled(({ scrollOverlay, ...rest }) => <DialogOverlay {...rest} />)`
  &[data-reach-dialog-overlay] {
    z-index: 1040;
    background-color: transparent;
    overflow: hidden;

    display: flex;
    align-items: center;
    overflow-y: ${({ scrollOverlay }) => scrollOverlay && 'scroll'};
    justify-content: center;

    background-color: ${({ theme }) => theme.backgroundScrim};
  }
`

const StyledDialogContent = styled(({ minHeight, maxHeight, mobile, isOpen, scrollOverlay, ...rest }) => (
  <DialogContent {...rest} />
)).attrs({
  'aria-label': 'dialog',
})`
  overflow-y: auto;

  &[data-reach-dialog-content] {
    margin: auto;
    background-color: ${({ theme }) => theme.deprecated_bg0};
    border: 1px solid ${({ theme }) => theme.deprecated_bg1};
    box-shadow: ${({ theme }) => theme.deepShadow};
    padding: 0px;
    width: 50vw;
    overflow-y: auto;
    overflow-x: hidden;

    align-self: ${({ mobile }) => mobile && 'flex-end'};

    max-width: 420px;
    ${({ maxHeight }) =>
      maxHeight &&
      css`
        max-height: ${maxHeight}vh;
      `}
    ${({ minHeight }) =>
      minHeight &&
      css`
        min-height: ${minHeight}vh;
      `}
    display: ${({ scrollOverlay }) => (scrollOverlay ? 'inline-table' : 'flex')};
    border-radius: 20px;
    ${({ theme }) => theme.deprecated_mediaWidth.deprecated_upToMedium`
      width: 65vw;
      margin: auto;
    `}
    ${({ theme, mobile }) => theme.deprecated_mediaWidth.deprecated_upToSmall`
      width:  85vw;
      ${
        mobile &&
        css`
          width: 100vw;
          border-radius: 20px;
          border-bottom-left-radius: 0;
          border-bottom-right-radius: 0;
        `
      }
    `}
  }
`

interface ModalProps {
  isOpen: boolean
  onDismiss: () => void
  minHeight?: number | false
  maxHeight?: number
  initialFocusRef?: RefObject<any>
  children?: ReactNode
  scrollOverlay?: boolean
}

export function Modal({
  isOpen,
  onDismiss,
  minHeight = false,
  maxHeight = 90,
  initialFocusRef,
  children,
  scrollOverlay,
}: ModalProps) {
  return (
    <StyledDialogOverlay
      isOpen={isOpen}
      onDismiss={onDismiss}
      initialFocusRef={initialFocusRef}
      scrollOverlay={scrollOverlay}
    >
      <StyledDialogContent
        aria-label="dialog content"
        minHeight={minHeight}
        maxHeight={maxHeight}
        scrollOverlay={scrollOverlay}
      >
        {children}
      </StyledDialogContent>
    </StyledDialogOverlay>
  )
}
