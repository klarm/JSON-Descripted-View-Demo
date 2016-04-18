//
//  FirstViewController.h
//  demo
//
//  Created by klarm on 15/6/24.
//  Copyright © 2015年 klarm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QYControlBase.h"


@protocol QYLayoutProtocol <NSObject>
@required
-(CGSize)getSize;
-(UIEdgeInsets)getPadding;
-(void)setPos:(CGRect)rc;

-(void)createElement:(NSDictionary*)dic parent:(id)parent;

-(void)setProperty:(NSDictionary*)property parent:(id)parent;

@end

