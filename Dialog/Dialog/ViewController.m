//
//  ViewController.m
//  Dialog
//
//  Created by 黄海 on 2016/10/27.
//  Copyright © 2016年 黄海. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


// alert - 只有一个确定按钮
- (IBAction)alertDialogButtonClick:(UIButton *)sender {
    
    // 旧版本的使用方法，已经抛弃
    /*UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"这是一个弹出的提示框。" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alert.delegate = self;  // 需要设置当前Controller代理 <UIAlertViewDelegate>
    [alert show];*/
    
    // 新版本的使用方法
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"这是一个弹出的提示框。" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self okActionClick:action];
    }];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}


// confirm - 一个确定一个取消按钮
- (IBAction)confirmDialogButtonClick:(UIButton *)sender {
    // 1.创建alert对象
    UIAlertController *confirm = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请问是否要删除数据？" preferredStyle:UIAlertControllerStyleAlert];
    
    // 2.创建两个action对象
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [self cancelActionClick:action];
    }];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self okActionClick:action];
    }];
    
    // 3.将action对象添加到alert上
    [confirm addAction:cancelAction];
    [confirm addAction:okAction];
    
    // 4.显示alert
    [self presentViewController:confirm animated:YES completion:nil];
}


// 带一个输入框的Alert
- (IBAction)promptDialogButtonClick:(UIButton *)sender {
    UIAlertController *prompt = [UIAlertController alertControllerWithTitle:@"请输入昵称" message:@"昵称必须是人类能看懂的，请勿填写火星文字。" preferredStyle:UIAlertControllerStyleAlert];
    //增加一个输入框
    [prompt addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入一个有效的昵称";
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *str = [prompt.textFields firstObject].text;
        NSLog(@"%@", str);
    }];
    [prompt addAction:cancelAction];
    [prompt addAction:okAction];
    [self presentViewController:prompt animated:YES completion:nil];
}

// ActionSheet
- (IBAction)actionSheetButtonClick:(UIButton *)sender {
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"请选择一种操作方式" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *videoAction = [UIAlertAction actionWithTitle:@"小视屏" style:UIAlertActionStyleDestructive handler:nil];
    UIAlertAction *shootAction = [UIAlertAction actionWithTitle:@"抓拍" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *albumAction = [UIAlertAction actionWithTitle:@"从手机相册选择" style:UIAlertActionStyleDefault handler:nil];
    // style为UIAlertActionStyleCancel的，会单独显示在下面
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [actionSheet addAction:videoAction];
    [actionSheet addAction:shootAction];
    [actionSheet addAction:albumAction];
    [actionSheet addAction:cancelAction];
    [self presentViewController:actionSheet animated:YES completion:nil];
}


// 旧版代理方法
/*
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *str = [NSString stringWithFormat:@"你点击了第%ld个按钮。", buttonIndex];
    NSLog(str);
}
*/

// 点击确定按钮
- (void)okActionClick:(id)sender {
    NSLog(@"你点击了OK按钮。");
}

// 点击取消按钮
-(void)cancelActionClick:(id)sender {
    NSLog(@"你点击了取消按钮。");
}
@end
