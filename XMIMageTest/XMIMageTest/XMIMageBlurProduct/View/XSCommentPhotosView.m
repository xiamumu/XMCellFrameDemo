//
//  XSCommentPhotosView.m
//  XSSPH
//
//  Created by XM on 17/3/19.
//  Copyright © 2017年 Jeanne. All rights reserved.
//

#define PhotosMaxCount 9
#define PhotosMaxCols 3
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define photosW ScreenWidth - ScreenWidth / 7 - 60
#define PhotoW (photosW - PhotoMargin * 2) / 3
#define PhotoH PhotoW
#define PhotoMargin 2


#import "XSCommentPhotosView.h"
#import "UIImageView+WebCache.h"


@implementation XSCommentPhotosView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        self.userInteractionEnabled = YES;
        // 预先创建9个图片控件
        for (int i = 0; i<PhotosMaxCount; i++) {
            UIImageView *photo = [[UIImageView alloc] init];
            photo.userInteractionEnabled = YES;
            photo.layer.masksToBounds = YES;
            photo.contentMode = UIViewContentModeScaleAspectFill;
            photo.tag = i;
            [self addSubview:photo];
            
            // 添加手势监听器（一个手势监听器 只能 监听对应的一个view）
            UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] init];
            [recognizer addTarget:self action:@selector(tapPhoto:)];
            [photo addGestureRecognizer:recognizer];
        }
    }
    return self;
}


/**
 *  监听图片的点击(查看大图片)
 */
- (void)tapPhoto:(UITapGestureRecognizer *)recognizer
{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    
    UIImageView *photo = (UIImageView *)recognizer.view;

//    GoodsPictureModel *model = [[GoodsPictureModel alloc] init];
//    model.image = photo.image;
//    
//    AllScreenImageView *allScreen = [[AllScreenImageView alloc]initWithFrame:CGRectMake(0, 0,K_SCREEN_WIDTH, K_SCREEN_HEIGHT) andImageModel:model];
//    allScreen.mIsShowDeleteButton = NO;
//    [APP_DELEGATE.mWindow addSubview:allScreen];
    
}


- (void)setPicUrls:(NSArray *)picUrls
{
    _picUrls = picUrls;
    
    for (int i = 0; i<PhotosMaxCount; i++) {
        UIImageView *photo = self.subviews[i];
        
        if (i < picUrls.count) { // 显示图片
            
            [photo sd_setImageWithURL:[NSURL URLWithString:[picUrls objectAtIndex:i]] placeholderImage:nil];
            photo.hidden = NO;
        } else { // 隐藏
            photo.hidden = YES;
        }
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    int count = (int)self.picUrls.count;
    for (int i = 0; i<count; i++) {
        
        int col = i % PhotosMaxCols;
        int row = i / PhotosMaxCols;
        
        UIImageView *photo = self.subviews[i];
//        photo.width = PhotoW;
//        photo.height = PhotoH;
//        photo.left = col * (PhotoW + PhotoMargin);
//        photo.top = row * (PhotoH + PhotoMargin);
        photo.frame = CGRectMake(col * (PhotoW + PhotoMargin), row * (PhotoH + PhotoMargin), PhotoW, PhotoH);
    }
}

+ (CGSize)sizeWithPhotosCount:(int)photosCount
{

    // 总列数
//    int totalCols = photosCount >= PhotosMaxCols ?  PhotosMaxCols : photosCount;
    
    // 总行数
    int totalRows = (photosCount + PhotosMaxCols - 1) / PhotosMaxCols;
    
    // 计算尺寸
//    CGFloat photosW = totalCols * PhotoW + (totalCols - 1) * PhotoMargin;
    
    
    CGFloat photosH = totalRows * PhotoH + (totalRows - 1) * PhotoMargin;
    return CGSizeMake(photosW, photosH);
}


@end
