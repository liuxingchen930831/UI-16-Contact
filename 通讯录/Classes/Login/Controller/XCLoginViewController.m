//
//  XCLoginViewController.m
//  通讯录
//
//  Created by liuxingchen on 16/10/12.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCLoginViewController.h"
#import "MBProgressHUD+XMG.h"
@interface XCLoginViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *remPwdSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;


@end

@implementation XCLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.accountTextField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.passWordTextField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self textChange];
}
-(void)textChange
{
//    if (self.accountTextField.text.length && self.passWordTextField.text.length) {
//        self.loginButton.enabled =YES;
//    }
    //登录button是否可做交互
    self.loginButton.enabled = self.accountTextField.text.length>0 && self.passWordTextField.text.length>0 ;
}
- (IBAction)loginAction:(id)sender
{
    if ([self.accountTextField.text isEqualToString:@"lxc"] &&[self.passWordTextField.text isEqualToString:@"lxc"]) {
        [MBProgressHUD showSuccess:@"Success"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUD];
            //手动型Segue 找到标示为login的segue
            [self performSegueWithIdentifier:@"login" sender:nil];
        });
    } else{
        [MBProgressHUD showError:@"error"];
    }
}
//这个方法会在跳转之前调用
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController *vc = segue.destinationViewController;
    vc.title = [NSString stringWithFormat:@"%@的联系人",self.accountTextField.text];
}
//switch开关同步
- (IBAction)remPWDAction:(id)sender
{
    if (self.remPwdSwitch.on ==NO) {
        self.autoLoginSwitch.on = NO;
    }
}
- (IBAction)autoLoginAction:(id)sender
{
    if (self.autoLoginSwitch.on == YES) {
        self.remPwdSwitch.on = YES;
    }
}
@end
