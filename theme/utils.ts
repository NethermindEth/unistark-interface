import {createGlobalThemeContract} from '@vanilla-extract/css'
import {assignInlineVars} from '@vanilla-extract/dynamic'

import {Theme} from "./types";

const themeContractValues = {
    colors: {
        accentFailure: '',
        accentFailureSoft: '',
        accentAction: '',
        accentActionSoft: '',

        explicitWhite: '',
        gold: '',
        green: '',
        violet: '',

        backgroundFloating: '',
        backgroundInteractive: '',
        backgroundModule: '',
        backgroundOutline: '',
        backgroundSurface: '',
        backgroundBackdrop: '',

        modalBackdrop: '',

        stateOverlayHover: '',

        textPrimary: '',
        textSecondary: '',
        textTertiary: '',
    },

    shadows: {
        menu: '',
        genieBlue: '',
        elevation: '',
        tooltip: '',
        deep: '',
        shallow: '',
    },
}
export const themeVars = createGlobalThemeContract(themeContractValues, (_, path) => `genie-${path.join('-')}`)

export function cssStringFromTheme(theme: Theme | (() => Theme), options: { extends?: Theme | (() => Theme) } = {}) {
    return Object.entries(cssObjectFromTheme(theme, options))
        .map(([key, value]) => `${key}:${value};`)
        .join('')
}

export function cssObjectFromTheme(
    theme: Theme | (() => Theme),
    {extends: baseTheme}: { extends?: Theme | (() => Theme) } = {}
) {
    const resolvedThemeVars = {
        ...assignInlineVars(themeVars, resolveTheme(theme)),
    }

    if (!baseTheme) {
        return resolvedThemeVars
    }

    const resolvedBaseThemeVars = assignInlineVars(themeVars, resolveTheme(baseTheme))

    const filteredVars = Object.fromEntries(
        Object.entries(resolvedThemeVars).filter(([varName, value]) => value !== resolvedBaseThemeVars[varName])
    )

    return filteredVars
}

const resolveTheme = (theme: Theme | (() => Theme)) => (typeof theme === 'function' ? theme() : theme)