//
//  PromotionCollectionViewCell.m
//  IndiCard
//
//  Created by Pongpat Weesommai on 18/3/18.
//  Copyright © 2018 Pongpat Weesommai. All rights reserved.
//

#import "PromotionCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation PromotionCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)prepareForReuse {
    [super prepareForReuse];
    [self.promotionImageView sd_cancelCurrentAnimationImagesLoad];
    //self.promotionImageView.image = [UIImage imageNamed:@"image"];
}

@end
