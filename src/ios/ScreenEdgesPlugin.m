#import "ScreenEdgesPlugin.h"
#import <Cordova/CDV.h>

@implementation ScreenEdgesPlugin

static UIRectEdge _preferredEdges = UIRectEdgeNone;
static NSString*const LOG_TAG = @"ScreenEdgesPlugin[native]";

+ (UIRectEdge)preferredEdges {
  return _preferredEdges;
}

- (void)pluginInitialize {
    NSLog(@"ScreenEdgesPlugin - pluginInitialize");
}

- (void)setPreferredEdges:(CDVInvokedUrlCommand *)command {
    [self.commandDelegate runInBackground:^{
        @try {
            if (@available(iOS 11.0, *)) {
                NSArray* edgeStrings = [command.arguments objectAtIndex:0];
                UIRectEdge edges = UIRectEdgeNone;
                for (id str in edgeStrings) {
                    if      ([str isEqual:@"top"])    edges |= UIRectEdgeTop;
                    else if ([str isEqual:@"bottom"]) edges |= UIRectEdgeBottom;
                    else if ([str isEqual:@"left"])   edges |= UIRectEdgeLeft;
                    else if ([str isEqual:@"right"])  edges |= UIRectEdgeRight;
                    else if ([str isEqual:@"all"])    edges |= UIRectEdgeAll;
                }

                NSLog(@"Screen Edges. got edges: %lu", edges);

                _preferredEdges = edges;
                [self.viewController setNeedsUpdateOfScreenEdgesDeferringSystemGestures];
            }

            CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }@catch (NSException *exception) {
            NSLog(@"%@ ERROR: %@", LOG_TAG, exception.reason);

            CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:exception.reason];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }
    }];
}

@end
