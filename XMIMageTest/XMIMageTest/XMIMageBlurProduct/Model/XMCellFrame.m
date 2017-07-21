//
//  XMImageBlurCellFrame.m
//  XMIMageTest
//
//  Created by XM on 17/7/17.
//  Copyright © 2017年 XM. All rights reserved.
//

#import "XMCellFrame.h"
#import "XSCommentPhotosView.h"


@interface XMCellFrame ()

@property (nonatomic, assign) CGRect iconFrame;

@property (nonatomic, assign) CGRect nickNameFrame;

@property (nonatomic, assign) CGRect desFrame;

@property (nonatomic, assign) CGRect photosFrame;

@property (nonatomic, assign) CGRect lookTitleFrame;

@property (nonatomic, assign) CGRect moreBtnFrame;

@property (nonatomic, assign) CGRect attentionFrame;

@property (nonatomic, assign) CGRect redBagFrame;

@property (nonatomic, assign) CGRect lineFrame;

@property (nonatomic, assign) CGFloat cellHeight;


@end


@implementation XMCellFrame
    
- (void)setModel:(XMCellModel *)model
{
    _model = model;
    
    CGFloat ScreenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat leftMargin = 10;
    
    CGFloat iconFrame_X = leftMargin;
    CGFloat iconFrame_Y = leftMargin;
    CGFloat iconFrame_W = ScreenWidth/7.0;
    CGFloat iconFrame_H = ScreenWidth/7.0;
    self.iconFrame = CGRectMake(iconFrame_X, iconFrame_Y, iconFrame_W, iconFrame_H);
    
    CGFloat nickNameFrame_X = CGRectGetMaxX(self.iconFrame) + 10;
    CGFloat nickNameFrame_Y = leftMargin * 2;
    CGFloat nickNameFrame_W = ScreenWidth - nickNameFrame_X - 10;
    CGFloat nickNameFrame_H = 15;
    self.nickNameFrame = CGRectMake(nickNameFrame_X, nickNameFrame_Y, nickNameFrame_W, nickNameFrame_H);
    
    CGFloat des_H = [model.content boundingRectWithSize:CGSizeMake(nickNameFrame_W, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12]} context:nil].size.height + 5;
    
    CGFloat desFrame_X = nickNameFrame_X;
    CGFloat desFrame_Y = CGRectGetMaxY(self.nickNameFrame) + 10;
    CGFloat desFrame_W = nickNameFrame_W;
    CGFloat desFrame_H = des_H;
    self.desFrame = CGRectMake(desFrame_X, desFrame_Y, desFrame_W, desFrame_H);
    
    CGFloat h = CGRectGetMaxY(self.desFrame) + 10;
    
    if (model.pic.count > 0) {
        CGFloat photosFrame_X = nickNameFrame_X;
        CGFloat photosFrame_Y = h;
        CGSize photoSframeSize = [XSCommentPhotosView sizeWithPhotosCount:(int)model.pic.count];
        self.photosFrame = (CGRect){{photosFrame_X, photosFrame_Y}, photoSframeSize};
        
        h = CGRectGetMaxY(self.photosFrame) + 10;
        
    }
    
    if (model.red_count > 0) {
        NSString *lookTitle = [NSString stringWithFormat:@"%@人查看了照片，共%@元", model.red_count, model.red_balance];
        CGFloat lookTitle_W = [lookTitle sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12]}].width + 5;
        
        CGFloat lookTitleFrame_X = nickNameFrame_X;
        CGFloat lookTitleFrame_Y = h;
        CGFloat lookTitleFrame_W = lookTitle_W;
        CGFloat lookTitleFrame_H = 12;
        self.lookTitleFrame = CGRectMake(lookTitleFrame_X, lookTitleFrame_Y, lookTitleFrame_W, lookTitleFrame_H);
        
        h = CGRectGetMaxY(self.lookTitleFrame) + 10;
    }
    
    NSString *attentionStr = [NSString stringWithFormat:@"关注%@", model.concern_count];
    CGFloat attention_W = [attentionStr sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12]}].width + 5;
    
    CGFloat attentionFrame_X = nickNameFrame_X;
    CGFloat attentionFrame_Y = h;
    CGFloat attentionFrame_W = attention_W;
    CGFloat attentionFrame_H = 12;
    self.attentionFrame = CGRectMake(attentionFrame_X, attentionFrame_Y, attentionFrame_W, attentionFrame_H);
    
    CGFloat redBagFrame_H = 20;
    CGFloat redBagFrame_X = CGRectGetMaxX(self.attentionFrame) + 10;
    CGFloat redBagFrame_Y = attentionFrame_Y - (redBagFrame_H - attentionFrame_H) * 0.5;
    CGFloat redBagFrame_W = 80;
    self.redBagFrame = CGRectMake(redBagFrame_X, redBagFrame_Y, redBagFrame_W, redBagFrame_H);
    
    
    h = CGRectGetMaxY(self.attentionFrame) + 10;
    
    CGFloat lineFrame_H = 0.5;
    CGFloat lineFrame_X = iconFrame_X;
    CGFloat lineFrame_Y = h - lineFrame_H;
    CGFloat lineFrame_W = ScreenWidth - lineFrame_X;
    self.lineFrame = CGRectMake(lineFrame_X, lineFrame_Y, lineFrame_W, lineFrame_H);

    
    self.cellHeight = h;

    
}

@end
