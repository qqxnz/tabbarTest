//
//  TabBarViewController.m
//  tabbarTest
//
//  Created by lv on 2018/9/4.
//  Copyright © 2018年 lv. All rights reserved.
//

#import "TabBarViewController.h"
#import "AAAViewController.h"
#import "BBBViewController.h"
#import "CCCViewController.h"
#import "DDDViewController.h"
#import "EEEViewController.h"

#import "CustomTabBar.h"

@interface TabBarViewController ()<UITabBarControllerDelegate>

@property (nonatomic,strong) CustomTabBar *myTabBar;

@end

@implementation TabBarViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 更换tabBar
    _myTabBar = [[CustomTabBar alloc] init];
    _myTabBar.effectAreaY = 25;
    _myTabBar.imageView.image = [UIImage imageNamed:@"calendar"];
    [self setValue:_myTabBar forKeyPath:@"tabBar"];

    UIViewController *viewAAA = [[AAAViewController alloc] init];
    UIViewController *viewBBB = [[BBBViewController alloc] init];
    UIViewController *viewCCC = [[CCCViewController alloc] init];
    UIViewController *viewDDD = [[DDDViewController alloc] init];
    UIViewController *viewEEE = [[EEEViewController alloc] init];

    UITabBarItem *barItemAAA = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"home"] selectedImage:[UIImage imageNamed:@"home_selected"]];

    UITabBarItem *barItemBBB = [[UITabBarItem alloc] initWithTitle:@"健康" image:[UIImage imageNamed:@"health"] selectedImage:[UIImage imageNamed:@"health_selected"]];

    UITabBarItem *barItemCCC = [[UITabBarItem alloc] initWithTitle:@"日程" image:[UIImage imageNamed:@""] selectedImage:[UIImage imageNamed:@""]];


    UITabBarItem *barItemDDD = [[UITabBarItem alloc] initWithTitle:@"发现" image:[UIImage imageNamed:@"find"] selectedImage:[UIImage imageNamed:@"find_selected"]];

    UITabBarItem *barItemEEE = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"home_page"] selectedImage:[UIImage imageNamed:@"home_page_selected"]];

    [barItemAAA setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor blackColor]} forState:UIControlStateNormal];
    [barItemBBB setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]} forState:UIControlStateNormal];
    [barItemCCC setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]} forState:UIControlStateNormal];
    [barItemDDD setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]} forState:UIControlStateNormal];
    [barItemEEE setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]} forState:UIControlStateNormal];
    barItemAAA.tag = 0;
    barItemBBB.tag = 1;
    barItemCCC.tag = 2;
    barItemDDD.tag = 3;
    barItemEEE.tag = 4;

    viewAAA.tabBarItem = barItemAAA;
    viewBBB.tabBarItem = barItemBBB;
    viewCCC.tabBarItem = barItemCCC;
    viewDDD.tabBarItem = barItemDDD;
    viewEEE.tabBarItem = barItemEEE;



    [self addChildViewController:viewAAA];
    [self addChildViewController:viewBBB];
    [self addChildViewController:viewCCC];
    [self addChildViewController:viewDDD];
    [self addChildViewController:viewEEE];


    self.tabBar.backgroundColor = [UIColor whiteColor];
    self.tabBar.barTintColor = [UIColor whiteColor];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
    NSLog(@"------->>>>%i",item.tag);
    
    if(item.tag == 2){
        _myTabBar.imageView.image = [UIImage imageNamed:@"calendar_selected"];
    }else{
        _myTabBar.imageView.image = [UIImage imageNamed:@"calendar"];
    }
    
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
