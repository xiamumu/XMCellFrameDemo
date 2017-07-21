//
//  XMImageBlurCellFrame.h
//  XMIMageTest
//
//  Created by XM on 17/7/17.
//  Copyright © 2017年 XM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "XMCellModel.h"

@interface XMCellFrame : NSObject

@property (nonatomic, assign, readonly) CGRect iconFrame;

@property (nonatomic, assign, readonly) CGRect nickNameFrame;

@property (nonatomic, assign, readonly) CGRect desFrame;

@property (nonatomic, assign, readonly) CGRect photosFrame;

@property (nonatomic, assign, readonly) CGRect lookTitleFrame;

@property (nonatomic, assign, readonly) CGRect moreBtnFrame;

@property (nonatomic, assign, readonly) CGRect attentionFrame;

@property (nonatomic, assign, readonly) CGRect redBagFrame;

@property (nonatomic, assign, readonly) CGRect lineFrame;


@property (nonatomic, assign, readonly) CGFloat cellHeight;

@property (nonatomic, strong) XMCellModel *model;


@end
