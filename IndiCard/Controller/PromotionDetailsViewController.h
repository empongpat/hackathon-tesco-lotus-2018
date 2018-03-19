//
//  PromotionDetailsViewController.h
//  IndiCard
//
//  Created by Pongpat Weesommai on 18/3/18.
//  Copyright © 2018 Pongpat Weesommai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Promotion.h"

@interface PromotionDetailsViewController : UIViewController

@property (strong, nonatomic) Promotion *promotion;
@property (weak, nonatomic) IBOutlet UIImageView *promotionImageView;
@property (weak, nonatomic) IBOutlet UILabel *promotionCodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *originalPriceLabel;
@property (weak, nonatomic) IBOutlet UIView *slashView;
@property (weak, nonatomic) IBOutlet UILabel *salePriceLabel;
@property (weak, nonatomic) IBOutlet UITextView *promotionTextView;

@end
