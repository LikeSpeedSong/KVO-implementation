//
//  ViewController.m
//  KVO
//
//  Created by A_zhi on 2017/8/24.
//  Copyright © 2017年 Azhi. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "NSObject+Az_KVO.h"
@interface ViewController ()
@property (nonatomic,strong)Person * p;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Person * p =[[ Person alloc]init];
    [p AZ_addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    _p = p;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"%@",_p.name);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    static int i =0;
    i ++ ;
    _p.name = [NSString stringWithFormat:@"%d",i];
}


@end
