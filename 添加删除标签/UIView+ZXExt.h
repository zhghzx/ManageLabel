//
//  UIView+ZXExt.h
//  StarWardrobe
//
//  Created by qianfeng0 on 16/6/7.
//  Copyright © 2016年 ZX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZXExt)

@property(nonatomic,assign)CGFloat x;
@property(nonatomic,assign)CGFloat y;
@property(nonatomic,assign)CGFloat w;
@property(nonatomic,assign)CGFloat h;
@property(nonatomic,assign)CGFloat right;
@property(nonatomic,assign)CGFloat bottom;
@property(nonatomic,assign)CGFloat centerX;
@property(nonatomic,assign)CGFloat centerY;
@property(nonatomic,assign)CGSize size;
@property(nonatomic,assign)CGPoint origin;

@property (nonatomic,assign)IBInspectable CGFloat cornerRadius;
@end
