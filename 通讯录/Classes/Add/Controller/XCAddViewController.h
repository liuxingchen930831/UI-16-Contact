//
//  XCAddViewController.h
//  通讯录
//
//  Created by liuxingchen on 16/10/12.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XCContact,XCAddViewController;
@protocol XCAddViewControllerDelegate <NSObject>
@optional
-(void)XCAddViewController:(XCAddViewController *)addVC didClickAddButtonWithContact:(XCContact *)contact;
@end

@interface XCAddViewController : UIViewController
/** 代理*/
@property(nonatomic,weak)id<XCAddViewControllerDelegate> delegate ;
@end
