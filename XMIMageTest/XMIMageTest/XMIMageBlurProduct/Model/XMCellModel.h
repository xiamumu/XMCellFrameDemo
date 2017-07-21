//
//  XSIMageBlurModel.h
//  XMIMageTest
//
//  Created by XM on 17/7/17.
//  Copyright © 2017年 XM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMCellModel : NSObject

@property (nonatomic, strong) NSArray *pic;

@property (nonatomic, strong) NSNumber *push;
@property (nonatomic, strong) NSNumber *is_show;
@property (nonatomic, strong) NSNumber *red_count;
@property (nonatomic, strong) NSNumber *red_balance;
@property (nonatomic, strong) NSNumber *concern_count;
@property (nonatomic, copy) NSString *mobile;
@property (nonatomic, copy) NSString *balance;
@property (nonatomic, copy) NSString *thumb;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *content;


@end
