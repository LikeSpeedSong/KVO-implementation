//
//  NSObject+Az_KVO.m
//  KVO
//
//  Created by A_zhi on 2017/8/24.
//  Copyright © 2017年 Azhi. All rights reserved.
//

#import "NSObject+Az_KVO.h"
#import <objc/message.h>
static void *ObserverKey = &ObserverKey;
static void *KeyPathKey = &KeyPathKey;

@implementation NSObject (Az_KVO)
- (void)AZ_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context{
    NSString * newClass = [@"AZ" stringByAppendingString:NSStringFromClass([self class])];
    
    Class myClass = objc_allocateClassPair([self class], newClass.UTF8String, 0);
    
    
    class_addMethod(myClass, @selector(setName:), (IMP)setName, "v@:@");
    
    objc_registerClassPair(myClass);
    
    object_setClass(self, myClass);
    
    objc_setAssociatedObject(self, ObserverKey, observer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, KeyPathKey, keyPath, OBJC_ASSOCIATION_COPY);
}


void setName(id self ,SEL _cmd,NSString * name){
    id observer = objc_getAssociatedObject(self, ObserverKey);
    
    objc_msgSend(observer, @selector(observeValueForKeyPath:ofObject:change:context:),objc_getAssociatedObject(self, KeyPathKey),self,@{@"new":name},nil);
    
    id class = [self class];
    object_setClass(self, [self superclass]);
    objc_msgSend(self, @selector(setName:),name);
    object_setClass(self, class);
}

@end
