import {Theme} from "./types";
import {colors} from "./colors";

export const themeLight: Theme = {
  colors: {
    accentFailure: colors.red400,
    accentFailureSoft: 'rgba(250, 43, 57, 0.12)',
    accentAction: colors.pink400,
    accentActionSoft: 'rgba(251, 17, 142, 0.12)',

    explicitWhite: '#FFFFFF',

    backgroundFloating: '#00000000',
    backgroundInteractive: colors.gray100,
    backgroundModule: colors.gray50,
    backgroundOutline: `rgba(94,104,135,0.24)`,
    backgroundSurface: '#FFFFFF',
    backgroundBackdrop: '#FFF',

    modalBackdrop: 'rgba(0, 0, 0, 0.3)',

    stateOverlayHover: `rgba(153,161,189,0.08)`,
    green: colors.green400,
    gold: colors.gold400,
    violet: colors.violet400,

    textPrimary: colors.gray900,
    textSecondary: colors.gray500,
    textTertiary: colors.gray300,
  },
  shadows: {
    menu: '0px 10px 30px rgba(0, 0, 0, 0.1)',
    genieBlue: '0 4px 16px 0 rgba(251, 17, 142)',
    elevation: '0px 4px 16px rgba(70, 115, 250, 0.4)',
    tooltip: '0px 4px 16px rgba(10, 10, 59, 0.2)',
    deep: '8px 12px 20px rgba(51, 53, 72, 0.04), 4px 6px 12px rgba(51, 53, 72, 0.02), 4px 4px 8px rgba(51, 53, 72, 0.04)',
    shallow: '4px 4px 10px rgba(0, 0, 0, 0.24), 2px 2px 4px rgba(0, 0, 0, 0.12), 1px 2px 2px rgba(0, 0, 0, 0.12)',
  },
}
