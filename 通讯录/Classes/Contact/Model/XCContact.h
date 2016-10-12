//
//  XCContact.h
//  通讯录
//
//  Created by liuxingchen on 16/10/12.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XCContact : NSObject
/** 姓名*/
@property(nonatomic,copy)NSString * name ;
/** 手机号*/
@property(nonatomic,copy)NSString * phone ;
+(instancetype)contactWithName:(NSString *)name phone:(NSString *)phone;
@end
