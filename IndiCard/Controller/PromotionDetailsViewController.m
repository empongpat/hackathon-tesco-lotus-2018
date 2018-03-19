//
//  PromotionDetailsViewController.m
//  IndiCard
//
//  Created by Pongpat Weesommai on 18/3/18.
//  Copyright © 2018 Pongpat Weesommai. All rights reserved.
//

#import "PromotionDetailsViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface PromotionDetailsViewController ()

@end

@implementation PromotionDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.promotionImageView sd_setImageWithURL:[NSURL URLWithString:self.promotion.imageUrl]];
    self.promotionCodeLabel.text = self.promotion.code;
    NSString *baht = @" baht";
    self.originalPriceLabel.text = [NSString stringWithFormat:@"%@%@",self.promotion.originalPrice.stringValue, baht];
    self.salePriceLabel.text = [NSString stringWithFormat:@"%@%@",self.promotion.salePrice.stringValue, baht];
    self.promotionTextView.text = self.promotion.promotionDescription;
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
