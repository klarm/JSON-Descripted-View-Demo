//
//  FirstViewController.m
//  demo
//
//  Created by klarm on 15/6/24.
//  Copyright © 2015年 klarm. All rights reserved.
//

#import "QYLayoutVertical.h"

@interface QYLayoutVertical ()

@end

@implementation QYLayoutVertical

-(void)layout
{
    if (self.items.count == 0) {
        return;
    }
    
    CGSize szAvailable = CGSizeMake(CGRectGetWidth(self.rc), CGRectGetHeight(self.rc));
    
    CGSize szRemain = szAvailable;
    CGFloat yPos = 0;
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
            rcCtrl = CGRectMake(rcPadding.left, yPos+rcPadding.top, sz.width, sz.height);
            
            szRemain.height -= sz.height + rcPadding.top + rcPadding.bottom;
            
            yPos = rcCtrl.origin.y+rcCtrl.size.height+rcPadding.bottom;
            
            [item setPos:rcCtrl];
        }
    }
}

-(void)setProperty:(NSDictionary*)property parent:(id)parent;
{
    [super setProperty:property parent:parent];
    
    [self setFrame:self.rc];
    
    self.backgroundColor = [UIColor grayColor];
    
    self.layer.borderWidth = 1;
}

@end
