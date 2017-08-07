//
//  ViewController.m
//  FDAlertViewDemo
//
//  Created by fergusding on 15/5/26.
//  Copyright (c) 2015年 fergusding. All rights reserved.
//

#import "ViewController.h"
#import "FDAlertView.h"
#import "ContentView.h"
#import "ShowAlert.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showNormalAlert:(id)sender {

    [ShowAlert showAlertWithMessage:@"asdasdas" Message:@"sdsdfdsf" Buttons:@[@"确定", @"取消"] Sure:^{
        NSLog(@"___________()())()");
        [ShowAlert showAlertWithMessage:@"asdasdas" Message:@"sdsdfdsf" Buttons:@[@"确定"] Sure:^{
            NSLog(@"___________()())______()");
        }];
    }];
//    FDAlertView *alert = [[FDAlertView alloc] initWithTitle:@"退出登录" icon:nil message:@"确定退出登录吗？" delegate:self buttonTitles:@"确定", @"取消", nil];
//    [alert setMessageColor:[UIColor redColor] fontSize:0];
//    [alert show];
}

- (IBAction)showIconAlert:(id)sender {
    FDAlertView *alert = [[FDAlertView alloc] initWithTitle:@"退出登录" icon:[UIImage imageNamed:@"exclamation-icon"] message:@"你确定退出登录吗？" buttonTitles:@[@"确定", @"取消"]];
    [alert show];
    alert.sureBlock = ^(){
        FDAlertView *alert1 = [[FDAlertView alloc] initWithTitle:@"退出登录" icon:[UIImage imageNamed:@"exclamation-icon"] message:@"你确定退出登录吗？" buttonTitles:@[@"确定", @"取消"]];
        [alert1 show];
        alert1.sureBlock = ^(){
            NSLog(@"++++++");
        };
    };
}

- (IBAction)showContentAlert:(id)sender {
//    FDAlertView *alert = [[FDAlertView alloc] init];
    ContentView *contentView = [[NSBundle mainBundle] loadNibNamed:@"ContentView" owner:nil options:nil].lastObject;
//    contentView.frame = CGRectMake(0, 0, 270, 220);
//    alert.contentView = contentView;
//    [alert show];
    [ShowAlert showAlertWithCustom:contentView];
}

- (void)alertView:(FDAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"%ld", (long)buttonIndex);
}

@end
