//
//  UIView+PJPath.m
//  SPTAPLive
//
//  Created by PJ on 2019/1/22.
//  
//

#import "UIView+PJPath.h"
#import <objc/runtime.h>
#import "PJPathMacro.h"

@implementation UIView (PJPath)

+ (void)load
{
#ifdef DEBUG
#if kPrintPathLog == 1
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = [UIView class];
        Method m1 = class_getInstanceMethod(cls, @selector(hitTest:withEvent:));
        Method m2 = class_getInstanceMethod(cls, @selector(hitTest:withEvent_PJPath:));
        method_exchangeImplementations(m1, m2);
    });
#endif
#endif
}

- (UIView *)hitTest:(CGPoint)point withEvent_PJPath:(UIEvent *)event {
    printf("PJ_HitTest_Path:%s\n",self.description.UTF8String);
    return [self hitTest:point withEvent_PJPath:event];
}

@end
