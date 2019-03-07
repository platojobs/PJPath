//
//  NSObject+PJGesturePath.m
//  PJShowPath
//
//  Created by PJ on 17/1/3.
//  Copyright © PlatoJobs. All rights reserved.
//
//

#import "NSObject+PJGesturePath.h"
#import <objc/runtime.h>
#import "PJPathMacro.h"

@implementation NSObject (PJGesturePath)

+ (void)load
{
#ifdef DEBUG
#if kPrintPathLog == 1
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class cls = NSClassFromString(@"UIGestureRecognizerTarget");
        Method m1 = class_getInstanceMethod(cls, NSSelectorFromString(@"_sendActionWithGestureRecognizer:"));
        Method m2 = class_getInstanceMethod([self class], NSSelectorFromString(@"sendActionWithGestureRecognizer_PJGesture:"));
        method_exchangeImplementations(m1, m2);
    });
#endif
#endif
}

- (void)sendActionWithGestureRecognizer_PJGesture:(id)arg1
{
    [self sendActionWithGestureRecognizer_PJGesture:arg1];    
    printf("PJ_Gesture_Path:%s\n",self.description.UTF8String);
}

@end
