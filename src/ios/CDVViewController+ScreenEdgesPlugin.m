#import "CDVViewController+ScreenEdgesPlugin.h"
#import "ScreenEdgesPlugin.h"

@implementation CDVViewController (ScreenEdgesPlugin)

- (UIRectEdge)preferredScreenEdgesDeferringSystemGestures
{
    return ScreenEdgesPlugin.preferredEdges;
}

@end
