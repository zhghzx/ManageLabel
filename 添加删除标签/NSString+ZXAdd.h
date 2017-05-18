

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (ZXAdd)

/** 计算文本的size */
- (CGSize)zx_sizeWithFont:(UIFont *)font size:(CGSize)size;
/** 计算文本的高度 */
- (CGFloat)zx_heightWithFont:(UIFont *)font width:(CGFloat)width;

@end
