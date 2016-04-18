//
//  FirstViewController.m
//  demo
//
//  Created by klarm on 15/6/24.
//  Copyright © 2015年 klarm. All rights reserved.
//

#import "QYControlBase.h"
#import "QYLayoutBase.h"

@interface QYControlBase ()
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) UIEdgeInsets padding;
@end

@implementation QYControlBase

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    return self;
}

-(CGSize)getSize
{
    return self.size;
}

-(UIEdgeInsets)getPadding
{
    return self.padding;
}

-(void)setPos:(CGRect)rc
{
    [self setFrame:rc];
}

-(void)setProperty:(NSDictionary*)property parent:(id)parent;
{
    CGSize sz = CGSizeZero;
    if (property) {
        if ([property objectForKey:@"size"]) {
            NSString* size = property[@"size"];
            NSArray * components = [size componentsSeparatedByString:@","];
            NSString* width = components.firstObject;
            NSString* height = components.lastObject;
            sz = CGSizeMake(width.integerValue, height.integerValue);
        }
        
        if ([property objectForKey:@"padding"]) {
            NSString* padding = property[@"padding"];
            NSArray * components = [padding componentsSeparatedByString:@","];
            self.padding = UIEdgeInsetsMake([((NSString*)[components objectAtIndex:0]) integerValue],
                                            [((NSString*)[components objectAtIndex:1]) integerValue],
                                            [((NSString*)[components objectAtIndex:2]) integerValue],
                                            [((NSString*)[components objectAtIndex:3]) integerValue]);
        }

        
        [self setFrame:CGRectMake(0,
                                  0,
                                  sz.width,
                                  sz.height)];
        
        if ([parent isKindOfClass:[QYLayoutBase class]]) {
            [(QYLayoutBase*)parent addItem:self];
        }
        else{
            [(UIView*)parent addSubview:self];
        }

        
        //create children
        //        if ([property objectForKey:@"children"]) {
        //            id children = [property objectForKey:@"children"];
        //        }
    }
    
}

-(void)createElement:(NSDictionary*)dic parent:(id)parent
{
    
}

@end
