import styled from 'styled-components'
import { transparentize } from 'polished'

export const TooltipContainer = styled.div`
  max-width: 256px;
  padding: 0.6rem 1rem;
  font-weight: 400;
  word-break: break-word;

  background: ${({ theme }) => theme.deprecated_bg0};
  border-radius: 12px;
  border: 1px solid ${({ theme }) => theme.deprecated_bg2};
  box-shadow: 0 4px 8px 0 ${({ theme }) => transparentize(0.9, theme.shadow1)};
`
