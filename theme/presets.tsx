// Preset styles of the Rebass Text component
// import { Text, TextProps } from 'rebass'
import styled from 'styled-components'
import { AllColors } from './styled'

const TextWrapper = styled.span<{ color: keyof AllColors }>`
  color: ${({ color, theme }) => (theme as any)[color]};
`

export const ThemedText = {
  BodyPrimary(props: any) {
    return <TextWrapper fontWeight={400} fontSize={16} color={'textPrimary'} {...props} />
  },
  BodySecondary(props: any) {
    return <TextWrapper fontWeight={400} fontSize={16} color={'textSecondary'} {...props} />
  },
  HeadlineSmall(props: any) {
    return <TextWrapper fontWeight={600} fontSize={20} lineHeight="28px" color={'textPrimary'} {...props} />
  },
  LargeHeader(props: any) {
    return <TextWrapper fontWeight={400} fontSize={36} color={'textPrimary'} {...props} />
  },
  Link(props: any) {
    return <TextWrapper fontWeight={600} fontSize={14} color={'accentAction'} {...props} />
  },
  MediumHeader(props: any) {
    return <TextWrapper fontWeight={400} fontSize={20} color={'textPrimary'} {...props} />
  },
  SubHeader(props: any) {
    return <TextWrapper fontWeight={600} fontSize={16} color={'textPrimary'} {...props} />
  },
  SubHeaderSmall(props: any) {
    return <TextWrapper fontWeight={500} fontSize={14} color={'textSecondary'} {...props} />
  },
  DeprecatedMain(props: any) {
    return <TextWrapper fontWeight={500} color={'deprecated_text2'} {...props} />
  },
  DeprecatedLink(props: any) {
    return <TextWrapper fontWeight={500} color={'deprecated_primary1'} {...props} />
  },
  DeprecatedLabel(props: any) {
    return <TextWrapper fontWeight={600} color={'deprecated_text1'} {...props} />
  },
  DeprecatedBlack(props: any) {
    return <TextWrapper fontWeight={500} color={'deprecated_text1'} {...props} />
  },
  DeprecatedWhite(props: any) {
    return <TextWrapper fontWeight={500} color={'deprecated_white'} {...props} />
  },
  DeprecatedBody(props: any) {
    return <TextWrapper fontWeight={400} fontSize={16} color={'deprecated_text1'} {...props} />
  },
  DeprecatedLargeHeader(props: any) {
    return <TextWrapper fontWeight={600} fontSize={24} {...props} />
  },
  DeprecatedMediumHeader(props: any) {
    return <TextWrapper fontWeight={500} fontSize={20} {...props} />
  },
  DeprecatedSubHeader(props: any) {
    return <TextWrapper fontWeight={400} fontSize={14} {...props} />
  },
  DeprecatedSmall(props: any) {
    return <TextWrapper fontWeight={500} fontSize={11} {...props} />
  },
  DeprecatedBlue(props: any) {
    return <TextWrapper fontWeight={500} color={'deprecated_blue1'} {...props} />
  },
  DeprecatedYellow(props: any) {
    return <TextWrapper fontWeight={500} color={'deprecated_yellow3'} {...props} />
  },
  DeprecatedDarkGray(props: any) {
    return <TextWrapper fontWeight={500} color={'deprecated_text3'} {...props} />
  },
  DeprecatedGray(props: any) {
    return <TextWrapper fontWeight={500} color={'deprecated_bg3'} {...props} />
  },
  DeprecatedItalic(props: any) {
    return <TextWrapper fontWeight={500} fontSize={12} fontStyle={'italic'} color={'deprecated_text2'} {...props} />
  },
  DeprecatedError({ error, ...props }: { error: boolean } & any) {
    return <TextWrapper fontWeight={500} color={error ? 'deprecated_red1' : 'deprecated_text2'} {...props} />
  },
}
