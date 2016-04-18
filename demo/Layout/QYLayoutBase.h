//
//  FirstViewController.h
//  demo
//
//  Created by klarm on 15/6/24.
//  Copyright © 2015年 klarm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QYControlBase.h"
#import "QYLayoutProtocol.h"
#import "QYLayoutManager.h"

@interface QYLayoutBase : UIView<QYLayoutProtocol>

@property (nonatomic, strong)NSMutableArray* items;
@property (nonatomic, strong)QYLayoutBase* parent;
@property (nonatomic, assign)CGRect rc;

-(CGSize)getSize;
-(UIEdgeInsets)getPadding;
-(void)setPos:(CGRect)rc;

-(instancetype)init;

-(void)addItem:(UIView*)item;
-(void)addItemAt:(UIView*)item Index:(NSInteger)index;

-(void)removeItem:(UIView*)item;
-(void)removeItemAt:(NSInteger)index;
-(void)removeAllItems;

-(void)layout;

-(void)setProperty:(NSDictionary*)property parent:(id)parent;

-(void)createElement:(NSDictionary*)dic parent:(id)parent;
@end

