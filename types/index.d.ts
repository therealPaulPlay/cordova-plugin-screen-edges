// Licensed under the MIT license.

declare type CordovaPluginScreenEdge = 'top' | 'bottom' | 'left' | 'right' | 'all';

interface Window {
    /** This plugin sets the prioritized screen edges for your app in iOS, which overrides
     *  the default system gesture handling. */
    ScreenEdgesPlugin: {
        /** Dismiss the splash screen. */
        setPreferredEdges(edges: CordovaPluginScreenEdge[], success?: () => void, error?: (err: string) => void): void;
    }
}
