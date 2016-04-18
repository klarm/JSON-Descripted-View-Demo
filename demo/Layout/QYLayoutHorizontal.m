//
//  FirstViewController.m
//  demo
//
//  Created by klarm on 15/6/24.
//  Copyright © 2015年 klarm. All rights reserved.
//

#import "QYLayoutHorizontal.h"

@interface QYLayoutHorizontal ()

@end
@implementation QYLayoutHorizontal

-(void)layout
{
    if (self.items.count == 0) {
        return;
    }
    
    CGSize szAvailable = CGSizeMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    
    CGSize szRemain = szAvailable;
    CGFloat xPos = 0;
    for (NSInteger index = 0; index < self.items.count; index++) {
        UIView* ctrl = [self.items objectAtIndex:index];
        if (ctrl.hidden) {
            continue;
        }
        
        if ([ctrl conformsToProtocol:@protocol(QYLayoutProtocol)]) {
            id<QYLayoutProtocol> item = (id<QYLayoutProtocol>)ctrl;
            CGSize sz = [item getSize];
            UIEdgeInsets rcPadding = [item getPadding];
            
            CGRect rcCtrl = CGRectZero;
            rcCtrl = CGRectMake(xPos+rcPadding.left, rcPadding.top, sz.width, sz.height);
            
            szRemain.width -= sz.width + rcPadding.left + rcPadding.right;
            
            xPos = rcCtrl.origin.x+rcCtrl.size.width+rcPadding.right;
            
            [item setPos:rcCtrl];
        }
    }
}

-(void)setProperty:(NSDictionary*)property parent:(id)parent;
{
    [super setProperty:property parent:parent];
    
    self.backgroundColor = [UIColor whiteColor];
    
    self.layer.borderWidth = 1;
    
    //parse self property
}

@end
