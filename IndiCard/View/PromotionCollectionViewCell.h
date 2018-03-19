//
//  PromotionCollectionViewCell.h
//  IndiCard
//
//  Created by Pongpat Weesommai on 18/3/18.
//  Copyright © 2018 Pongpat Weesommai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PromotionCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *promotionImageView;
@property (weak, nonatomic) IBOutlet UILabel *originalPriceLabel;
@property (weak, nonatomic) IBOutlet UIView *slashView;
@property (weak, nonatomic) IBOutlet UILabel *salePriceLabel;
@property (weak, nonatomic) IBOutlet UITextView *promotionTextView;
@property (weak, nonatomic) IBOutlet UIButton *useButton;

@end
