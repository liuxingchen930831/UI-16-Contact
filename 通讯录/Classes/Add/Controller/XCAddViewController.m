//
//  XCAddViewController.m
//  通讯录
//
//  Created by liuxingchen on 16/10/12.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCAddViewController.h"
#import "XCContact.h"
@interface XCAddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UIButton *addButton;

@end

@implementation XCAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.nameTextField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.phoneTextField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.nameTextField becomeFirstResponder];
}
-(void)textChange
{
    if (self.nameTextField.text.length >0 && self.phoneTextField.text.length>0) {
        self.addButton.enabled = YES;
    }
}
- (IBAction)addAction:(id)sender
{
    //把传递的值包装成一个模型
    XCContact *c = [XCContact contactWithName:self.nameTextField.text phone:self.phoneTextField.text];
    //遵守代理有没有响应didClickAddButtonWithContact:方法
    if ([self.delegate respondsToSelector:@selector(XCAddViewController:didClickAddButtonWithContact:)]) {
        [_delegate XCAddViewController:self didClickAddButtonWithContact:c];
    }
    [self.navigationController popViewControllerAnimated:YES];
}
@end
