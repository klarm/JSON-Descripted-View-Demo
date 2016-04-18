//
//  FirstViewController.m
//  demo
//
//  Created by klarm on 15/6/24.
//  Copyright © 2015年 klarm. All rights reserved.
//

#import "FirstViewController.h"
#import "AppDelegate.h"
#import "QYLayoutManager.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)loadView{
    UIWindow* window = [(AppDelegate *)[[UIApplication sharedApplication] delegate] window];

    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@"recommend_p_n.png"] selectedImage:[UIImage imageNamed:@"recommend_p_p.png"]];
    
    self.tabBarItem = item;
    
    self.view = [[UIView alloc]initWithFrame:window.bounds];
    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    btn.frame = CGRectMake(0, 0, 150, 70);
//    btn.center = CGPointMake(160, 240);
//    btn.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
//    [btn setTitle:@"first tab" forState:UIControlStateNormal];
//
//    [self.view addSubview:btn];
    
    QYLayoutManager* layoutMrg = [QYLayoutManager sharedInstance];
    [layoutMrg initWithRootView:self.view];    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)willTransitionToTraitCollection:(UITraitCollection *)newCollection
//              withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator
//{
//    [super willTransitionToTraitCollection:newCollection
//                 withTransitionCoordinator:coordinator];
//    //for ipad case
//    if (newCollection.horizontalSizeClass == UIUserInterfaceSizeClassRegular &&
//        newCollection.verticalSizeClass == UIUserInterfaceSizeClassRegular) {
//        
//    }else  if (newCollection.horizontalSizeClass == UIUserInterfaceSizeClassCompact &&
//               newCollection.verticalSizeClass == UIUserInterfaceSizeClassRegular) {
//    }
//    
////    NSLog(@"newCollection horizontalSizeClass=%@ verticalSizeClass=%@", formatSizeClassString:newCollection.horizontalSizeClass, formatSizeClassString:newCollection.verticalSizeClass);
//     NSLog(@"newCollection horizontalSizeClass=%ld verticalSizeClass=%ld", (long)newCollection.horizontalSizeClass, (long)newCollection.verticalSizeClass);
//}


@end
