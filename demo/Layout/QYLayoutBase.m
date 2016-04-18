//
//  FirstViewController.m
//  demo
//
//  Created by klarm on 15/6/24.
//  Copyright © 2015年 klarm. All rights reserved.
//

#import "QYLayoutBase.h"

@interface QYLayoutBase ()
@property (nonatomic, assign) UIEdgeInsets padding;
@end

@implementation QYLayoutBase

- (instancetype)init
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.items = [NSMutableArray array];
        self.rc = CGRectZero;
    }
    return self;
}

-(void)addItem:(UIView*)item
{
    if (self.items) {
        [self.items addObject:item];
        [self addSubview:item];
    }
}

-(void)addItemAt:(UIView*)item Index:(NSInteger)index
{
    if (self.items) {
        [self.items insertObject:item atIndex:index];
        [self addSubview:item];
    }
}

-(void)removeItem:(UIView*)item
{
    if (self.items){
        [self.items removeObject:item];
        [item removeFromSuperview];
    }
}

-(void)removeItemAt:(NSInteger)index;
{
    if (self.items) {
        UIView* item = [self.items objectAtIndex:index];
        [item removeFromSuperview];
        [self.items removeObjectAtIndex:index];
    }
}

-(void)removeAllItems
{
    if (self.items) {
        [self.items removeAllObjects];
        
        for (UIView* item in self.subviews) {
            [item removeFromSuperview];
        }
    }
}

-(void)layout
{
    
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
        
        self.rc = CGRectMake(self.parent ? self.frame.origin.x : 0,
                             self.parent ? self.frame.origin.y : 0,
                             sz.width,
                             sz.height);
        
        [self setFrame:self.rc];
                
        if ([parent isKindOfClass:[QYLayoutBase class]]) {
            [(QYLayoutBase*)parent addItem:self];
        }
        else{
            [(UIView*)parent addSubview:self];
        }
        
        //reg container
        [[QYLayoutManager sharedInstance] registerContainer:self];
        
        //create children
        if ([property objectForKey:@"children"]) {
            id children = [property objectForKey:@"children"];
            if ([children isKindOfClass:[NSArray class]]) {
                NSArray* items = (NSArray*)children;
                [items enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    if ([obj isKindOfClass:[NSDictionary class]]) {
                        NSDictionary* child = (NSDictionary*)obj;
                        NSString* name = (NSString*)[child objectForKey:@"name"];
                        Class className = NSClassFromString(name);
                        id item = [[className alloc]init];
                        if ([item conformsToProtocol:@protocol(QYLayoutProtocol)]) {
                            id<QYLayoutProtocol> ctrl = (id<QYLayoutProtocol>)item;
                            [ctrl setProperty:child parent:self];
                        }
                    }
                }];
            }
        }
    }
}

-(CGSize)getSize
{
    return self.frame.size;
}

-(UIEdgeInsets)getPadding
{
    return self.padding;
}

-(void)setPos:(CGRect)rc
{
    [self setFrame:rc];
}

-(void)createElement:(NSDictionary*)dic parent:(id)parent
{
    
}

@end
