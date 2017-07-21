//
//  XSCommentPhotosView.h
//  XSSPH
//
//  Created by XM on 17/3/19.
//  Copyright © 2017年 Jeanne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XSCommentPhotosView : UIView

@property (nonatomic, strong) NSArray *picUrls;

+ (CGSize)sizeWithPhotosCount:(int)photosCount;


@end
