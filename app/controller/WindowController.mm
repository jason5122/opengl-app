#import "WindowController.h"
#import "view/OpenGLLayer.h"

@implementation WindowController

- (instancetype)initWithFrame:(NSRect)frameRect {
    self = [super init];
    if (self) {
        unsigned int mask = NSWindowStyleMaskTitled | NSWindowStyleMaskResizable |
                            NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable;
        self.window = [[NSWindow alloc] initWithContentRect:frameRect
                                                  styleMask:mask
                                                    backing:NSBackingStoreBuffered
                                                      defer:false];
        self.window.title = @"OpenGL App";

        mainView = [[NSView alloc] initWithFrame:frameRect];
        CAOpenGLLayer* openGLLayer = [OpenGLLayer layer];
        openGLLayer.needsDisplayOnBoundsChange = true;
        // openGLLayer.asynchronous = true;
        mainView.layer = openGLLayer;

        self.window.contentView = mainView;
    }
    return self;
}

- (void)showWindow {
    [self.window center];
    [self.window setFrameAutosaveName:@"opengl-app"];
    [self.window makeKeyAndOrderFront:nil];
}

@end
