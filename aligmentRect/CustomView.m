//
//  CustomView.m
//  aligmentRect
//
//  Created by 马雪松 on 2016/11/8.
//  Copyright © 2016年 bestn1nja. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)dirtyRect {
    [self layer].backgroundColor = [[UIColor whiteColor] CGColor];
    UIBezierPath *path;
    CGFloat dx = (self.frame.size.width-170)/2.0f+3;
    CGFloat dy = (self.frame.size.height-170)/2.0f+3;///2.0f;
    
    CGRect rect = CGRectMake(7 + dx, 7 + dy, 160, 160);
    path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:32];
    [[[UIColor blackColor] colorWithAlphaComponent:0.3f] set];
    [path fill];
    
    rect.origin = CGPointMake(dx, dy);
//    CGRect rect = CGRectMake(3, 3, 160, 160);
    path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:32];
    [[UIColor blackColor] set];
    path.lineWidth=6;
    [path stroke];
    
    [[UIColor orangeColor] set];
    [path fill];
    
    NSLog(@"%@",NSStringFromCGRect(self.frame));
    NSLog(@"dx=%f, dy=%f",dx,dy);
}

- (CGSize)intrinsicContentSize{
    return CGSizeMake(170, 170);
}

#define USE_ALIGNMENT_RECTS 0
#if USE_ALIGNMENT_RECTS

-(UIEdgeInsets)alignmentRectInsets{//这到底是干嘛用的？添加上上方还是右侧就有两条线
    CGFloat scale = (CGFloat)170/160;
    CGSize size = [self intrinsicContentSize];
    CGFloat dx = size.width*scale-170;
    CGFloat dy = size.height*scale-170;
//    [self frame] = CGSizeMake(size.width*scale, size.height*scale);
    NSLog(@"Insets-dx=%f, Insets-dy=%f",dx,dy);
    return UIEdgeInsetsMake(dy,dx,0,0);
//    return UIEdgeInsetsMake(0, 0,0, 0);

}
#endif
@end
