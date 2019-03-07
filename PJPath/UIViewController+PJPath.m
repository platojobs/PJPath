//
//  UIViewController+PJPath.m
//  PJShowPath
//
//  Created by PJ on 17/1/2.
//  Copyright © 2017年 PlatoJobs. All rights reserved.
//  
//

#import "UIViewController+PJPath.h"
#import <objc/runtime.h>
#import "PJPathMacro.h"

@implementation UIViewController (PJPath)

+ (void)load
{
#ifdef DEBUG
#if kPrintPathLog == 1
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = [UIViewController class];
        Method m1 = class_getInstanceMethod(cls, @selector(viewDidLoad));
        Method m2 = class_getInstanceMethod(cls, @selector(ViewDidLoad_PJPath));
        method_exchangeImplementations(m1, m2);
    });
#endif
#endif
}

- (void)ViewDidLoad_PJPath
{
    [self ViewDidLoad_PJPath];
    printf("PJ_VC_Path当前控制器:%s\n",NSStringFromClass(self.class).UTF8String);
}

@end
