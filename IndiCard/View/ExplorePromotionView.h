//
//  ExplorePromotionView.h
//  IndiCard
//
//  Created by Pongpat Weesommai on 18/3/18.
//  Copyright © 2018 Pongpat Weesommai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExploreViewController.h"
#import "Promotion.h"

@interface ExplorePromotionView : UIView <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *promotionCollectionView;
@property (weak, nonatomic) IBOutlet UIView *loadingContainer;

@property (strong, nonatomic) Promotion *selectedPromotion;

+ (id)init:(ExploreViewController *)viewController;

@end
