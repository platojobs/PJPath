//
//  UICollectionView+PJPath.m
//  longzhu
//
//  Created by PJ on 2017/8/11.
//  Copyright © 2017年 PlatoJobs. All rights reserved.
//
//  

#import "UICollectionView+PJPath.h"
#import <objc/runtime.h>
#import "PJPathMacro.h"

@implementation UICollectionView (PJPath)

+ (void)load
{
#ifdef DEBUG
#if kPrintPathLog == 1
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = [UICollectionView class];
        //Note:it's a private class action! Don't submit to the App Store!
        Method m1 = class_getInstanceMethod(cls, NSSelectorFromString(@"_selectItemAtIndexPath:animated:scrollPosition:notifyDelegate:"));
        Method m2 = class_getInstanceMethod(cls, NSSelectorFromString(@"selectItemAtIndexPath:animated:scrollPosition:notifyDelegate_PJPath:"));
        method_exchangeImplementations(m1, m2);
        
    });
#endif
#endif
}

- (void)selectItemAtIndexPath:(id)arg1 animated:(BOOL)arg2 scrollPosition:(unsigned int)arg3 notifyDelegate_PJPath:(BOOL)arg4
{
    [self selectItemAtIndexPath:arg1 animated:arg2 scrollPosition:arg3 notifyDelegate_PJPath:arg4];
    printf("PJ_UICollectionView_Delegate_Path:%s\n",NSStringFromClass([self.delegate class]).UTF8String);
}

@end
