//
//  FirstViewController.m
//  demo
//
//  Created by klarm on 15/6/24.
//  Copyright © 2015年 klarm. All rights reserved.
//

#import "QYButton.h"

@interface QYButton ()
@end

@implementation QYButton

-(void)setProperty:(NSDictionary*)property parent:(id)parent;
{
    [super setProperty:property parent:parent];
        
    self.backgroundColor = [UIColor colorWithHue:drand48() saturation:1.0 brightness:1.0 alpha:1.0];

}

-(CGSize)getSize
{
    return self.frame.size;
}


@end
