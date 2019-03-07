//
//  UIControl+PJPath.m
//  PJShowPath
//
//  Created by PJ on 17/1/2.
//  Copyright © 2017年 PlatoJobs. All rights reserved.
//  
//

#import "UIControl+PJPath.h"
#import <objc/runtime.h>
#import "PJPathMacro.h"

@implementation UIControl (PJPath)

+(void)load
{
#ifdef DEBUG
#if kPrintPathLog == 1
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = [UIControl class];
        Method m1 = class_getInstanceMethod(cls, @selector(sendAction:to:forEvent:));
        Method m2 = class_getInstanceMethod(cls, @selector(sendAction_PJPath:to:forEvent:));
        method_exchangeImplementations(m1, m2);
    });
#endif
#endif
}

- (void)sendAction_PJPath:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    [self sendAction_PJPath:action to:target forEvent:event];
    printf("PJ_UIControl_Path:%s,Action:%s\n",NSStringFromClass([target class]).UTF8String,[NSStringFromSelector(action) UTF8String]);
}

@end
