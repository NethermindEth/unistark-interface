import {colors} from "./colors";
import {Theme} from "./types";

export const themeDark: Theme = {
  colors: {
    accentFailure: colors.red300,
    accentFailureSoft: 'rgba(253, 118, 107, 0.12)',
    accentAction: colors.blue400,
    accentActionSoft: 'rgba(76, 130, 251, 0.24)',

    explicitWhite: '#FFFFFF',
    green: colors.green200,
    gold: colors.gold200,
    violet: colors.violet200,

    backgroundFloating: '0000000C',
    backgroundInteractive: colors.gray700,
    backgroundModule: colors.gray800,
    backgroundOutline: `rgba(153,161,189,0.24)`,
    backgroundSurface: colors.gray900,
    backgroundBackdrop: '#000',

    modalBackdrop: 'linear-gradient(0deg, rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7))',

    stateOverlayHover: `rgba(153,161,189,0.08)`,

    textPrimary: '#FFFFFF',
    textSecondary: colors.gray300,
    textTertiary: colors.gray500,
  },
  shadows: {
    menu: '0px 10px 30px rgba(0, 0, 0, 0.1)',
    genieBlue: '0 4px 16px 0 rgba(70, 115, 250, 0.4)',
    elevation: '0px 4px 16px rgba(70, 115, 250, 0.4)',
    tooltip: '0px 4px 16px rgba(255, 255, 255, 0.2)',
    deep: '12px 16px 24px rgba(0, 0, 0, 0.24), 12px 8px 12px rgba(0, 0, 0, 0.24), 4px 4px 8px rgba(0, 0, 0, 0.32)',
    shallow: '4px 4px 10px rgba(0, 0, 0, 0.24), 2px 2px 4px rgba(0, 0, 0, 0.12), 1px 2px 2px rgba(0, 0, 0, 0.12)',
  },
}
