//
//  FirstViewController.m
//  demo
//
//  Created by klarm on 15/6/24.
//  Copyright © 2015年 klarm. All rights reserved.
//

#import "RootViewController.h"
#import "AppDelegate.h"

@interface RootViewController ()

@end

@implementation RootViewController


- (void)willTransitionToTraitCollection:(UITraitCollection *)newCollection
              withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator
{
    [super willTransitionToTraitCollection:newCollection
                 withTransitionCoordinator:coordinator];
//    [coordinator animateAlongsideTransition:^(id <UIViewControllerTransitionCoordinatorContext> context) {
//        if (newCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact) {
//            //To Do: modify something for compact vertical size
//        } else {
//            //To Do: modify something for other vertical size
//        }
//        [self.view setNeedsLayout];
//    } completion:nil];
    
    //for ipad case
    if (newCollection.horizontalSizeClass == UIUserInterfaceSizeClassRegular &&
        newCollection.verticalSizeClass == UIUserInterfaceSizeClassRegular) {
        
    }else  if (newCollection.horizontalSizeClass == UIUserInterfaceSizeClassCompact &&
               newCollection.verticalSizeClass == UIUserInterfaceSizeClassRegular) {
    }}

@end
