//
//  HKBAlertVC.m
//  Takeaway
//
//  Created by hank on 2020/9/1.
//  Copyright © 2020 CJ. All rights reserved.
//

#import "HKBAlertVC.h"

@interface HKBAlertVC ()

@end

@implementation HKBAlertVC

/*
 
 CJAlertVC *vc = [CJAlertVC presentAlert];
 kHKWEAKSELF
 [self presentViewController:vc animated:YES completion:nil];
 */
 
/// 弹窗创建工厂方法
+ (instancetype)presentAlert {
    HKBAlertVC *vc = [[self alloc] init];
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve; // 设置弹出方式
    vc.providesPresentationContextTransitionStyle = YES;
    vc.definesPresentationContext = YES;
    vc.modalPresentationStyle = UIModalPresentationOverFullScreen; // 设置全屏显示
    return vc;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    self.view.alpha = 0;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self show];
}
- (void)show {
    [UIView animateWithDuration:0.2 animations:^{
        self.view.alpha = 1;
    } completion:nil];
}
- (void)dismiss {
    [UIView animateWithDuration:0.2 animations:^{
        self.view.alpha = 0;
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
}
@end
