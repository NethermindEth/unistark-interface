export interface Theme {
    colors: Colors;
    shadows: Shadows;
}
export interface Colors {
    accentFailure: string;
    accentFailureSoft: string;
    accentAction: string;
    accentActionSoft: string;
    explicitWhite: string;
    gold: string;
    green: string;
    violet: string;
    backgroundFloating: string;
    backgroundInteractive: string;
    backgroundModule: string;
    backgroundOutline: string;
    backgroundSurface: string;
    backgroundBackdrop: string;
    modalBackdrop: string;
    stateOverlayHover: string;
    textPrimary: string;
    textSecondary: string;
    textTertiary: string;
}
export interface Shadows {
    menu: string;
    genieBlue: string;
    elevation: string;
    tooltip: string;
    deep: string;
    shallow: string;
}
