//
//  GLViewController.m
//  test
//
//  Created by ramemiso on 2013/09/23.
//  Copyright (c) 2013年 ramemiso. All rights reserved.
//

#import "GLViewController.h"
#import <OpenGLES/ES2/gl.h>

@interface GLViewController () {
}
@property (strong, nonatomic) EAGLContext *context;

@end

@implementation GLViewController

- (id)initWithView : (UIView*) baseView
{
    self.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];

    if (!self.context) {
        NSLog(@"Failed to create ES context");
    }
    
    // レイヤーのセットアップ(iOS特有の処理)
    CAEAGLLayer *layer = (CAEAGLLayer*)self.layer;
    layer.opaque = YES;
    [EAGLContext setCurrentContext:self.context];
    // レンダーバッファーのセットアップ
    GLuint renderBuffer;
    glGenRenderbuffers(1, &renderBuffer);
    glBindRenderbuffer(GL_RENDERBUFFER, renderBuffer);
    [self.context renderbufferStorage:GL_RENDERBUFFER fromDrawable:layer];
    // フレームバッファーのセットアップ
    GLuint frameBuffer;
    glGenFramebuffers(1, &frameBuffer);
    glBindFramebuffer(GL_FRAMEBUFFER, frameBuffer);
    glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_RENDERBUFFER, renderBuffer);
    
    return self;
}
- (void)update:(NSTimer *)timer{
    // 色をセット
    glClearColor(0.0f, 1.0f, 1.0f, 1.0f);
    // カラーバッファを塗りつぶす
    glClear(GL_COLOR_BUFFER_BIT);
    // フレームバッファの内容を描画する(OS によって実装方法が異なります)
    [self.context presentRenderbuffer:GL_RENDERBUFFER];
    
     GLfloat rgba[4];
     glGetFloatv(GL_COLOR_CLEAR_VALUE, rgba);
//     NSLog(@"%f %f %f %f", rgba[0], rgba[1], rgba[2], rgba[3]);
}
// ゲームループメソッド(1/60秒ごとに呼び出される)
- (void)viewUpdate
{
    // ゲームループ60FPS
    [NSTimer scheduledTimerWithTimeInterval:1/60.0f target:self selector:@selector(update:) userInfo:nil repeats:YES];
}

@end
