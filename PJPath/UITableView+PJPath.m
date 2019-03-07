//
//  UITableView+PJPath.m
//  longzhu
//
//  Created by PJ on 2017/8/11.
//  Copyright © 2017年 PlatoJobs. All rights reserved.
//
//  

#import "UITableView+PJPath.h"
#import <objc/runtime.h>
#import "PJPathMacro.h"

@implementation UITableView (PJPath)

+ (void)load
{
#ifdef DEBUG
#if kPrintPathLog == 1
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = [UITableView class];
        //Note:it's a private class action! Don't submit to the App Store!
        Method m1 = class_getInstanceMethod(cls, NSSelectorFromString(@"_selectRowAtIndexPath:animated:scrollPosition:notifyDelegate:"));
        Method m2 = class_getInstanceMethod(cls, NSSelectorFromString(@"selectRowAtIndexPath:animated:scrollPosition:notifyDelegate_PJPath:"));
        method_exchangeImplementations(m1, m2);
        
    });
#endif
#endif
}

- (void)selectRowAtIndexPath:(id)arg1 animated:(BOOL)arg2 scrollPosition:(int)arg3 notifyDelegate_PJPath:(BOOL)arg4
{
    [self selectRowAtIndexPath:arg1 animated:arg2 scrollPosition:arg3 notifyDelegate_PJPath:arg4];
    printf("PJ_UITableView_Delegate_Path:%s\n",NSStringFromClass([self.delegate class]).UTF8String);
}

@end
