//
//  NSObject+Az_KVO.h
//  KVO
//
//  Created by A_zhi on 2017/8/24.
//  Copyright © 2017年 Azhi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Az_KVO)
- (void)AZ_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;
@end
