//
//  CustomTabBar.m
//  HitTesting
//
//  Created by mac on 2017/5/19.
//  Copyright © 2017年 flowyears. All rights reserved.
//

#import "CustomTabBar.h"

@implementation CustomTabBar

- (instancetype)init
{
    self = [super init];
    if (self) {
        UIImageView *img = [[UIImageView alloc] init];
        img.bounds = CGRectMake(0, 0, 55, 55);
        img.backgroundColor = [UIColor whiteColor];
        img.layer.masksToBounds = YES;
        img.layer.cornerRadius = 27.5;
        self.imageView = img;
        [self addSubview:self.imageView];
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    ///iphone X 适配
    if(UIScreen.mainScreen.bounds.size.height == 812.0){
        self.imageView.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.1);
    }else{
        self.imageView.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.15);
    }
}


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (!self.isUserInteractionEnabled || self.isHidden || self.alpha <= 0.01)
    {
        return nil;
    }

    if ([self pointInside:point withEvent:event])
    {
        return [self mmHitTest:point withEvent:event];
    }
    else
    {
        CGFloat tabBarItemWidth = self.bounds.size.width/self.items.count;
        CGFloat left = self.center.x - tabBarItemWidth/2;
        CGFloat right = self.center.x + tabBarItemWidth/2;
        
        if (point.x < right &&
            point.x > left)
        {//当点击的point的x坐标是中间item范围内，才去修正落点
            CGPoint otherPoint = CGPointMake(point.x, point.y + self.effectAreaY);
            return [self mmHitTest:otherPoint withEvent:event];
        }
    }
    return nil;
}

- (UIView *)mmHitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    for (UIView *subview in [self.subviews reverseObjectEnumerator])
    {
        CGPoint convertedPoint = [subview convertPoint:point fromView:self];
        UIView *hitTestView = [subview hitTest:convertedPoint withEvent:event];
        if (hitTestView) {
            return hitTestView;
        }
    }
    return nil;
}

@end
