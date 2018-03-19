//
//  ExplorePromotionView.m
//  IndiCard
//
//  Created by Pongpat Weesommai on 18/3/18.
//  Copyright © 2018 Pongpat Weesommai. All rights reserved.
//

#import "ExplorePromotionView.h"
#import "Constants.h"
#import "PromotionCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
@import FirebaseDatabase;

@interface ExplorePromotionView ()

@property ExploreViewController *exploreViewController;

@property FIRDatabaseReference *databaseRef;
@property FIRDatabaseReference *tescoLotusClubCardDatabaseRef;
@property FIRDatabaseReference *tescoLotusClubCardPromotionDatabaseRef;

@property NSMutableArray<Promotion *> *currentPromotionList;


@end

@implementation ExplorePromotionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (id)init:(ExploreViewController *)viewController {
    ExplorePromotionView *explorePromotionView = nil;
    
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"ExplorePromotionView" owner:nil options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[ExplorePromotionView class]]) {
            explorePromotionView = (ExplorePromotionView *)object;
            break;
        }
    }
    explorePromotionView.exploreViewController = viewController;
    
    explorePromotionView.currentPromotionList = [NSMutableArray new];
    
    explorePromotionView.promotionCollectionView.delegate = explorePromotionView;
    explorePromotionView.promotionCollectionView.dataSource = explorePromotionView;
    [explorePromotionView.promotionCollectionView registerNib:[UINib nibWithNibName:@"PromotionCollectionViewCell"  bundle:nil] forCellWithReuseIdentifier:@"PromotionCell"];
    
    [explorePromotionView setFirebaseRef];
    
    [explorePromotionView readDataFromFirebase];
    
    return explorePromotionView;
}

- (void)setFirebaseRef {
    self.databaseRef = [[FIRDatabase database] reference];
    self.tescoLotusClubCardDatabaseRef = [self.databaseRef child:@"tescoLotusClubCard"];
    self.tescoLotusClubCardPromotionDatabaseRef = [self.tescoLotusClubCardDatabaseRef child:@"promotion"];
}

- (void)readDataFromFirebase {
    //FIRDatabaseQuery *promotionsRelatedToUser = [[self.tescoLotusClubCardPromotionDatabaseRef queryStartingAtValue:@"AAAAAAAAA"] queryLimitedToFirst:2];
    FIRDatabaseQuery *promotionsRelatedToUser = [self.tescoLotusClubCardPromotionDatabaseRef queryLimitedToFirst:2];
    [promotionsRelatedToUser observeEventType:FIRDataEventTypeChildAdded withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        if (!self.loadingContainer.isHidden) {
            self.loadingContainer.hidden = YES;
        }
        Promotion *promotion = [self parseSnapshot:snapshot];
        [self.currentPromotionList addObject:promotion];
        [self.promotionCollectionView reloadData];
    }];
}

- (Promotion *)parseSnapshot:(FIRDataSnapshot *)snapshot {
    Promotion *promotion = [Promotion new];
    promotion.code = snapshot.key;
    promotion.category = snapshot.value[@"category"];
    promotion.originalPrice = snapshot.value[@"originalPrice"];
    promotion.salePrice = snapshot.value[@"salePrice"];
    promotion.promotionDescription = snapshot.value[@"promotionDescription"];
    promotion.imageUrl = snapshot.value[@"imageUrl"];
    
    return promotion;
}

#pragma mark - UICollectionView Delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.currentPromotionList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"PromotionCell";
    PromotionCollectionViewCell *cellView = (PromotionCollectionViewCell *)[self.promotionCollectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cellView == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PromotionCollectionViewCell" owner:self options:nil];
        cellView = [nib firstObject];
    }
   
    Promotion *promotion = self.currentPromotionList[indexPath.item];
    [cellView.promotionImageView sd_setImageWithURL:[NSURL URLWithString:promotion.imageUrl]];
    NSString *baht = @" baht";
    cellView.originalPriceLabel.text = [NSString stringWithFormat:@"%@%@",promotion.originalPrice.stringValue, baht];
    cellView.salePriceLabel.text = [NSString stringWithFormat:@"%@%@",promotion.salePrice.stringValue, baht];
    cellView.promotionTextView.text = promotion.promotionDescription;
    cellView.layer.cornerRadius = CARD_CORNER_RADIUS;
    cellView.layer.masksToBounds = YES;
    
    return cellView;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedPromotion = [self.currentPromotionList objectAtIndex:indexPath.item];
    [self.exploreViewController performSegueWithIdentifier:@"showPromotionDetailsViewController" sender:self.exploreViewController];
}


#pragma mark - UICollectionView Flow Layout Delegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    //return CGSizeMake(CGRectGetWidth(collectionView.frame)/2 - 5,
                     // CGRectGetHeight(collectionView.frame)/2 - 5);
    double width = CGRectGetWidth(collectionView.frame)/2 - 5;
    double height = width / 0.7;
    return CGSizeMake(width, height);
}

@end
