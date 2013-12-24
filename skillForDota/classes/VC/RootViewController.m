//
//  RootViewController.m
//  skillForDota
//
//  Created by Ning on 13-12-23.
//  Copyright (c) 2013年 Ning. All rights reserved.
//

#import "RootViewController.h"
#import "CustomTarBar.h"

#import "HeroListViewController.h"
#import "EquipenmentListViewController.h"
#import "11ResuitListViewController.h"
#import "PromotionViewController.h"

@interface RootViewController ()

@property (nonatomic,strong)CustomTarBar *customTabBar;
@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.hidesBottomBarWhenPushed = YES;
        
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
