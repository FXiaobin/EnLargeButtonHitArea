//
//  UIButton+EnLarge.m
//  PublicDrug-Business
//
//  Created by fanxiaobin on 2017/3/28.
//  Copyright © 2017年 lovepinyao. All rights reserved.
//

#import "UIButton+EnLarge.h"
#import <objc/runtime.h>

@implementation UIButton (EnLarge)

static char topNameKey;
static char rightNameKey;
static char bottomNameKey;
static char leftNameKey;


-(void)setEnlargeEdgeWithEdgeInsets:(UIEdgeInsets)insets{
    CGFloat top = insets.top;
    CGFloat right = insets.right;
    CGFloat bottom = insets.bottom;
    CGFloat left = insets.left;
    
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(CGRect)enlargedRect{
    NSNumber *topEdge = objc_getAssociatedObject(self, &topNameKey);
    NSNumber *rightEdge = objc_getAssociatedObject(self, &rightNameKey);
    NSNumber *bottomEdge = objc_getAssociatedObject(self, &bottomNameKey);
    NSNumber *leftEdge = objc_getAssociatedObject(self, &leftNameKey);
    
    CGRect rect = CGRectZero;
    
    if(topEdge && rightEdge && bottomEdge && leftEdge){
        rect = CGRectMake(self.bounds.origin.x-leftEdge.floatValue, self.bounds.origin.y-topEdge.floatValue, self.bounds.size.width+leftEdge.floatValue+rightEdge.floatValue, self.bounds.size.height+topEdge.floatValue+bottomEdge.floatValue);
    }else{
        rect = self.bounds;
    }
    
    return rect;
}

-(UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    CGRect rect = [self enlargedRect];
    if(CGRectEqualToRect(rect, self.bounds)){
        return [super hitTest:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? self : nil;
}


/*
-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    
    CGRect bounds = self.bounds;
    //若原热区小于44x44，则放大热区，否则保持原大小不变
    CGFloat widthDelta = MAX(44.0 - bounds.size.width, 0);
    CGFloat heightDelta = MAX(44.0 - bounds.size.height, 0);
    bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
    return CGRectContainsPoint(bounds, point);
}
*/


@end
