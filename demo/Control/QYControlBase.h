//
//  FirstViewController.h
//  demo
//
//  Created by klarm on 15/6/24.
//  Copyright © 2015年 klarm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QYLayoutProtocol.h"

@interface QYControlBase : UIView<QYLayoutProtocol>

- (instancetype)initWithFrame:(CGRect)frame;

-(CGSize)getSize;
-(UIEdgeInsets)getPadding;
-(void)setPos:(CGRect)rc;

-(void)setProperty:(NSDictionary*)property parent:(id)parent;

@end

