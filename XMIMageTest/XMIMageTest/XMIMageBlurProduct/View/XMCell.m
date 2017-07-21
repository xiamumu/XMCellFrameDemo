//
//  XMImageBlurCell.m
//  XMIMageTest
//
//  Created by XM on 17/7/17.
//  Copyright © 2017年 XM. All rights reserved.
//

#import "XMCell.h"
#import "XSCommentPhotosView.h"
#import <UIImageView+WebCache.h>

@interface XMCell ()


@property (nonatomic, weak) UIImageView *icon;

@property (nonatomic, weak) UILabel *nickName;

@property (nonatomic, weak) UILabel *des;

@property (nonatomic, weak) UIButton *moreBtn;

@property (nonatomic, weak) UILabel *lookTitle;

@property (nonatomic, weak) UIButton *attentionBtn;

@property (nonatomic, weak) UIButton *redBagNumBtn;

@property (nonatomic, weak) XSCommentPhotosView *photos;
    
@property (nonatomic, weak) UIView *line;


@end


@implementation XMCell


+ (instancetype)cellWithTable:(UITableView *)table
{
    static NSString *ID = @"XMCell";
    XMCell *cell = [table dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[XMCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    CGFloat ScreenWidth = [UIScreen mainScreen].bounds.size.width;
    
    // 头像
    UIImageView *icon = [[UIImageView alloc] init];
    icon.layer.masksToBounds = YES;
    icon.layer.cornerRadius = ScreenWidth/7.0 * 0.5;
    [self.contentView addSubview:icon];
    self.icon = icon;
    
    // 昵称
    UILabel *nickName = [[UILabel alloc] init];
    nickName.textColor = [UIColor blackColor];
    nickName.font = [UIFont systemFontOfSize:15];
    nickName.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:nickName];
    self.nickName = nickName;
    
    
    // 动态
    UILabel *des = [[UILabel alloc] init];
    des.textColor = [UIColor blackColor];
    des.font = [UIFont systemFontOfSize:12];
    des.textAlignment = NSTextAlignmentLeft;
    des.numberOfLines = 0;
    [self.contentView addSubview:des];
    self.des = des;
    
    
    // 点击更多
    UIButton *moreBtn = [[UIButton alloc] init];
    [moreBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [moreBtn.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [moreBtn setTitle:@"更多" forState:UIControlStateNormal];
    [moreBtn addTarget:self action:@selector(moreBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:moreBtn];
    self.moreBtn = moreBtn;
    
    // 图片
    XSCommentPhotosView *photos = [[XSCommentPhotosView alloc] init];
    [self addSubview:photos];
    self.photos = photos;
    
    
    // 有多少人看了图片，红包多少钱
    UILabel *lookTitle = [[UILabel alloc] init];
    lookTitle.textColor = [UIColor redColor];
    lookTitle.font = [UIFont systemFontOfSize:12];;
    lookTitle.textAlignment = NSTextAlignmentLeft;
    lookTitle.numberOfLines = 0;
    [self.contentView addSubview:lookTitle];
    self.lookTitle = lookTitle;
    
    
    // 关注人数
    UIButton *attentionBtn = [[UIButton alloc] init];
    [attentionBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [attentionBtn.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [self.contentView addSubview:attentionBtn];
    self.attentionBtn = attentionBtn;
    
    
    // 红包数
    UIButton *redBagNumBtn = [[UIButton alloc] init];
    [redBagNumBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [redBagNumBtn.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [self.contentView addSubview:redBagNumBtn];
    self.redBagNumBtn = redBagNumBtn;

    // 自己做线
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:line];
    self.line = line;
}


- (void)setCell_frame:(XMCellFrame *)cell_frame
{
    _cell_frame = cell_frame;
    XMCellModel *model = cell_frame.model;
    
    // 给各个控件赋数据
    [self.icon sd_setImageWithURL:[NSURL URLWithString:model.thumb] placeholderImage:[UIImage imageNamed:@"default_icon"]];
    self.nickName.text = model.nickname;
    self.des.text = model.content;
    if (model.pic.count > 0) {
        self.photos.hidden = NO;
        [self.photos setPicUrls:model.pic];
    } else {
        self.photos.hidden = YES;
    }
    
    self.lookTitle.text = [NSString stringWithFormat:@"%@人查看了照片，共%@元", model.red_count, model.red_balance];
    
    [self.attentionBtn setTitle:[NSString stringWithFormat:@"关注%@", model.concern_count] forState:UIControlStateNormal];
    
    if (model.red_count > 0) {
        [self.redBagNumBtn setTitle:[NSString stringWithFormat:@"红包%@", model.red_count] forState:UIControlStateNormal];
    }
    
    // 给各个控件的frame 赋值
    self.icon.frame = cell_frame.iconFrame;
    self.des.frame = cell_frame.desFrame;
    self.nickName.frame = cell_frame.nickNameFrame;
    self.photos.frame = cell_frame.photosFrame;
    self.lookTitle.frame = cell_frame.lookTitleFrame;
    self.attentionBtn.frame = cell_frame.attentionFrame;
    self.redBagNumBtn.frame = cell_frame.redBagFrame;
    self.moreBtn.frame = cell_frame.moreBtnFrame;
    self.line.frame = cell_frame.lineFrame;
    
}

- (void)moreBtnAction
{
    NSLog(@"-=-=-=-=-点击更多-=-=-=-=-");
}


@end
