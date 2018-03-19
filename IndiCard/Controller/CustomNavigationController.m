//
//  CustomNavigationController.m
//  Cardlet
//
//  Created by Pongpat Weesommai on 17/3/18.
//  Copyright © 2018 Pongpat Weesommai. All rights reserved.
//

#import "CustomNavigationController.h"

@interface CustomNavigationController ()

@end

@implementation CustomNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationBar setShadowImage:[[UIImage alloc] init]];
    [self.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
