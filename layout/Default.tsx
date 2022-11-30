import ThemeProvider, {ThemedGlobalStyle} from "theme";

function DefaultLayout({children}: { children: any }) {
    return (
        <ThemeProvider>
            <ThemedGlobalStyle/>
            {children}
        </ThemeProvider>
    );
}

export default DefaultLayout;
