//
//  FirstViewController.h
//  demo
//
//  Created by klarm on 15/6/24.
//  Copyright © 2015年 klarm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QYControlBase.h"
#import "QYLayoutBase.h"

@class QYLayoutBase;

@interface QYLayoutManager : NSObject

@property (nonatomic, strong)NSMutableArray* items;
@property (nonatomic, assign)CGRect rc;

+(instancetype)sharedInstance;
-(void)initWithRootView:(UIView*)rootView;
-(void)registerContainer:(QYLayoutBase*)container;

@end

