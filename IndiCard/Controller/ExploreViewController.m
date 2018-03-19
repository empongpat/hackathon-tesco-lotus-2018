//
//  ExploreViewController.m
//  IndiCard
//
//  Created by Pongpat Weesommai on 18/3/18.
//  Copyright © 2018 Pongpat Weesommai. All rights reserved.
//

#import "ExploreViewController.h"
#import "ExplorePromotionView.h"
#import "ExploreRewardView.h"
#import "PromotionDetailsViewController.h"
#import "TYTabPagerView.h"
#import "Colors.h"

@interface ExploreViewController () <TYTabPagerViewDataSource, TYTabPagerViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *container;
@property TYTabPagerView *pagerView;
@property ExplorePromotionView *explorePromotionView;
@property ExploreRewardView *exploreRewardView;

@end

@implementation ExploreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.explorePromotionView = [ExplorePromotionView init:self];
    self.explorePromotionView.frame = CGRectMake(0, self.container.frame.origin.y, self.view.frame.size.width, self.container.frame.size.height);
    
    self.exploreRewardView = [ExploreRewardView init];
    self.exploreRewardView.frame = CGRectMake(0, self.container.frame.origin.y, self.view.frame.size.width, self.container.frame.size.height);
    
    [self addTabPagerView];
    [self.pagerView reloadData];
}

- (void)addTabPagerView {
    TYTabPagerView *pagerView = [[TYTabPagerView alloc]init];
    pagerView.tabBar.layout.barStyle = TYPagerBarStyleProgressBounceView;
    pagerView.tabBar.layout.cellWidth = CGRectGetWidth(self.view.frame)/2 - 6;
    pagerView.tabBar.layout.cellSpacing = 0.0;
    pagerView.tabBar.layout.progressWidth = pagerView.tabBar.layout.cellWidth;
    pagerView.tabBar.layout.normalTextColor = FONT_SECONDARY_COLOR;
    pagerView.tabBar.layout.selectedTextColor = FONT_PRIMARY_COLOR;
    pagerView.tabBar.progressView.backgroundColor = FONT_PRIMARY_COLOR;
    pagerView.dataSource = self;
    pagerView.delegate = self;
    [self.view addSubview:pagerView];
    self.pagerView = pagerView;
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.pagerView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame),CGRectGetHeight(self.view.frame));
}

#pragma mark - TYTabPagerView delegate

- (NSInteger)numberOfViewsInTabPagerView {
    return 2;
}

- (UIView *)tabPagerView:(TYTabPagerView *)tabPagerView viewForIndex:(NSInteger)index prefetching:(BOOL)prefetching {
    UIView *view = [[UIView alloc]initWithFrame:[tabPagerView.layout frameForItemAtIndex:index]];
    if (index == 0)
        view = self.explorePromotionView;
    else if (index == 1)
        view = self.exploreRewardView;
    //NSLog(@"viewForIndex:%ld prefetching:%d",index,prefetching);
    return view;
}

- (NSString *)tabPagerView:(TYTabPagerView *)tabPagerView titleForIndex:(NSInteger)index {
    NSString *title;
    if (index == 0)
        title = @"Promotion";
    else if (index == 1)
        title = @"Reward";
    
    return title;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"showPromotionDetailsViewController"]) {
        PromotionDetailsViewController *promotionDetailsViewController = [segue destinationViewController];
        Promotion *promotion = self.explorePromotionView.selectedPromotion;
        promotionDetailsViewController.promotion = promotion;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
