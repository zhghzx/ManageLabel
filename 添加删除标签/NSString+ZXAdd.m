

#import "NSString+ZXAdd.h"

@implementation NSString (ZXAdd)

- (CGSize)zx_sizeWithFont:(UIFont *)font size:(CGSize)size {
    NSDictionary *dict = @{NSFontAttributeName:font};
    CGRect rect = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    return rect.size;
}

- (CGFloat)zx_heightWithFont:(UIFont *)font width:(CGFloat)width {
    CGSize size = [self zx_sizeWithFont:font size:CGSizeMake(width, MAXFLOAT)];
    return size.height;
}


@end
