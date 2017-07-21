//
//  XMImageBlurCell.h
//  XMIMageTest
//
//  Created by XM on 17/7/17.
//  Copyright © 2017年 XM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMCellFrame.h"


@interface XMCell : UITableViewCell

@property (nonatomic, strong) XMCellFrame *cell_frame;

+ (instancetype)cellWithTable:(UITableView *)table;


@end
