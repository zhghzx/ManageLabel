//
//  ZXManageLabelView.m
//  添加删除标签
//
//  Created by zhangxing on 2017/5/18.
//  Copyright © 2017年 zhangxing. All rights reserved.
//

#import "ZXManageLabelView.h"
#import "NSString+ZXAdd.h"
#import "UIView+ZXExt.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface ZXManageLabelView ()

@property (nonatomic, assign) float right;
@property (nonatomic, assign) NSInteger labelTag;

@end

@implementation ZXManageLabelView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.right = 0;
        self.labelTag = 0;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
    }
    return self;
}

- (void)addLabelWithTitle:(NSString *)title {
    if (!title.length) {
        return;
    }
    //不能重复添加
    for (UILabel *label in self.subviews) {
        if ([label.text isEqualToString:title]) {
            return;
        }
    }
    CGSize size = [title zx_sizeWithFont:[UIFont systemFontOfSize:16] size:CGSizeMake(1000, 32)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectIntegral(CGRectMake(_right, 0, size.width+20, size.height+10))];
    _right = label.right+10;
    label.text = title;
    label.tag = _labelTag;
    label.font = [UIFont systemFontOfSize:15];
    label.backgroundColor = UIColorFromRGB(0xf2f2f2);
    label.userInteractionEnabled = YES;
    label.layer.masksToBounds = YES;
    label.layer.cornerRadius = 5;
    label.textColor = UIColorFromRGB(0x535353);
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandle:)];
    [label addGestureRecognizer:tap];
    _labelTag ++;
    if (_right>self.w) {
        __weak typeof(self) weakSelf = self;
        [UIView animateWithDuration:0.5 animations:^{
            [weakSelf setContentOffset:CGPointMake(_right-self.w, 0)];
        }];
    }
    self.contentSize = CGSizeMake(_right, 32);

}

#pragma mark -点击删除
- (void)tapHandle:(UITapGestureRecognizer *)tap {
    UILabel *label = (UILabel *)tap.self.view;
    for (UILabel *subLabel in self.subviews) {
        if (subLabel.x>label.x) {
            subLabel.tag -= 1;
            [UIView animateWithDuration:0.3 animations:^{
                subLabel.x -= label.w+10;
            }];
        }
    }
    _right -= label.w+10;
    [label removeFromSuperview];

    self.contentSize = CGSizeMake(_right, 32);

}


@end
