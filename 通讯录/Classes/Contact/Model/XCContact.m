//
//  XCContact.m
//  通讯录
//
//  Created by liuxingchen on 16/10/12.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCContact.h"

@implementation XCContact
+(instancetype)contactWithName:(NSString *)name phone:(NSString *)phone
{
    XCContact *contact = [[self alloc]init];
    contact.name = name;
    contact.phone = phone;
    return contact;
}
@end
