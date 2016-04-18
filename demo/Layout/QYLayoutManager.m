//
//  FirstViewController.m
//  demo
//
//  Created by klarm on 15/6/24.
//  Copyright © 2015年 klarm. All rights reserved.
//

#import "QYLayoutManager.h"
#import "QYLayoutHorizontal.h"
#import "QYLayoutVertical.h"
#import "QYButton.h"


@interface QYLayoutManager ()
@property (nonatomic, strong)UIView* rootView;
@property (nonatomic, strong)NSMutableArray* containers;
@end

@implementation QYLayoutManager

static QYLayoutManager* g_LayoutMgr = nil;

+(instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        g_LayoutMgr = [[QYLayoutManager alloc] init];
    });
    return g_LayoutMgr;
}

- (void)initWithRootView:(UIView *)rootView
{
    
    self.rootView = rootView;
    self.containers = [NSMutableArray array];
    
    //parse skin
    NSString *path = [[NSBundle mainBundle] pathForResource:@"skin" ofType:@"json"];
    NSData* data = [NSData dataWithContentsOfFile:path];
    
    NSError *error = nil;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    if (dic) {
        [self parseSkin:dic parent:rootView];
        [self layout];
    }
}

-(void)parseSkin:(NSDictionary*)skin parent:(id)parent
{
    if ([skin objectForKey:@"name"]) {
        NSString* name = (NSString*)[skin objectForKey:@"name"];
        Class className = NSClassFromString(name);
        id item = [[className alloc]init];
        if ([item conformsToProtocol:@protocol(QYLayoutProtocol)]) {
            id<QYLayoutProtocol> ctrl = (id<QYLayoutProtocol>)item;
            [ctrl setProperty:skin parent:parent];
        }
    }
}

//-(void)createHLayout:(id)parent property:(NSDictionary*)property
//{
//    QYLayoutHorizontal * hLayout = [[QYLayoutHorizontal alloc]initLayout];
//    hLayout.parent = parent;
//    
//    //    if ([parent isKindOfClass:[QYLayoutBase class]]) {
//    //        [(QYLayoutBase*)parent addItem:hLayout];
//    //    }
//    //    else{
//    //        [(UIView*)parent addSubview:hLayout];
//    //    }
//    
//    [hLayout setProperty:property parent:parent];
//    
//    [self.containers addObject:hLayout];
//}
//
//-(void)createVLayout:(id)parent property:(NSDictionary*)property
//{
//    QYLayoutVertical* vLayout = [[QYLayoutVertical alloc]initLayout];
//    //    vLayout.parent = parent;
//    //    if ([parent isKindOfClass:[QYLayoutBase class]]) {
//    //        [(QYLayoutBase*)parent addItem:vLayout];
//    //    }
//    //    else{
//    //        [(UIView*)parent addSubview:vLayout];
//    //    }
//    
//    [vLayout setProperty:property parent:parent];
//    
//    [self.containers addObject:vLayout];
//}
//
//-(void)createButton:(id)parent property:(NSDictionary*)property
//{
//    QYButton* btn = [[QYButton alloc]initWithFrame:CGRectZero];
//    //    if ([parent isKindOfClass:[QYLayoutBase class]]) {
//    //        [(QYLayoutBase*)parent addItem:btn];
//    //    }
//    //    else{
//    //        [(UIView*)parent addSubview:btn];
//    //    }
//    
//    [btn setProperty:property parent:parent];
//}

-(void)registerContainer:(QYLayoutBase*)container
{
    [self.containers addObject:container];
}

-(void)layout
{
//    for (id item in [self.containers reverseObjectEnumerator])
//    {
//        if ([item isKindOfClass:[QYLayoutBase class]]) {
//            [(QYLayoutBase*)item layout];
//        }
//    }
    
    for (id item in self.containers)
    {
        if ([item isKindOfClass:[QYLayoutBase class]]) {
            [(QYLayoutBase*)item layout];
        }
    }
}

@end
