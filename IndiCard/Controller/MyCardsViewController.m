//
//  MyCardsViewController.m
//  Cardlet
//
//  Created by Pongpat Weesommai on 17/3/18.
//  Copyright © 2018 Pongpat Weesommai. All rights reserved.
//

#import "MyCardsViewController.h"
#import "AddCardConfirmViewController.h"
#import "Constants.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface MyCardsViewController ()

@property (nonatomic) float widthHeightCard;
@property (weak, nonatomic) IBOutlet iCarousel *cardsCarousel;
@property (weak, nonatomic) IBOutlet UIView *noCardView;
@property (weak, nonatomic) IBOutlet UILabel *cardNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *cardNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *cardPointsLabel;
@property (weak, nonatomic) IBOutlet UIView *cardInfoView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *noCardLabel;
@property (weak, nonatomic) IBOutlet UIButton *addRewardButton;

@property NSUserDefaults *defaults;

@end

@implementation MyCardsViewController

- (IBAction)unwindToMyCards:(UIStoryboardSegue *)segue {
    if ([segue.identifier isEqualToString:@"fromAddCardConfirm"]) {
        AddCardConfirmViewController *confirmViewController = [segue sourceViewController];
        Card *card = [Card new];
        card.number = confirmViewController.barcodeNumber;
        card.name = confirmViewController.cardName;
        card.points = confirmViewController.cardPoints;
        card.imageName = confirmViewController.cardImageName;
        
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm transactionWithBlock:^{
            [realm addObject:card];
            [self.cardsCarousel reloadData];
        }];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.widthHeightCard = CGRectGetHeight(self.cardsCarousel.frame)*0.7;
    self.noCardView.layer.cornerRadius = CARD_CORNER_RADIUS;
    self.noCardView.layer.masksToBounds = YES;
    self.cardInfoView.layer.cornerRadius = CARD_CORNER_RADIUS;
    self.cardInfoView.layer.masksToBounds = YES;
    self.cardPointsLabel.layer.cornerRadius = POINT_CORNER_RADIUS;
    self.cardPointsLabel.layer.masksToBounds = YES;
    self.defaults = [NSUserDefaults standardUserDefaults];
    [FBSDKProfile loadCurrentProfileWithCompletion:^(FBSDKProfile *profile, NSError *error) {
        if (profile) {
            [self.defaults setObject:profile.name forKey:NAME_KEY];
            self.nameLabel.text = profile.name;
        }
    }];
    
    self.myCards = [Card allObjects];
    
    if (self.myCards.count > 0) {
        Card *card = [self.myCards firstObject];
        self.cardNameLabel.text = card.name;
        self.cardNumberLabel.text = card.number;
        NSNumberFormatter *formatter = [NSNumberFormatter new];
        formatter.numberStyle = NSNumberFormatterDecimalStyle;
        self.cardPointsLabel.text = [NSString stringWithFormat:@" %@ points    ", [formatter stringFromNumber:card.points]];
        self.noCardView.hidden = YES;
        self.noCardLabel.hidden = YES;
        self.cardNameLabel.hidden = NO;
        self.cardNumberLabel.hidden = NO;
        self.cardPointsLabel.hidden = NO;
    } else {
        self.noCardView.hidden = NO;
        self.noCardLabel.hidden = NO;
        self.cardNameLabel.hidden = YES;
        self.cardNumberLabel.hidden = YES;
        self.cardPointsLabel.hidden = YES;
    }
    
    self.cardsCarousel.dataSource = self;
    self.cardsCarousel.delegate = self;
    self.cardsCarousel.type = iCarouselTypeLinear;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (self.myCards.count > 0) {
        self.noCardView.hidden = YES;
        self.noCardLabel.hidden = YES;
        self.cardNameLabel.hidden = NO;
        self.cardNumberLabel.hidden = NO;
        self.cardPointsLabel.hidden = NO;
    } else {
        self.noCardView.hidden = NO;
        self.noCardLabel.hidden = NO;
        self.cardNameLabel.hidden = YES;
        self.cardNumberLabel.hidden = YES;
        self.cardPointsLabel.hidden = YES;
    }
}

#pragma mark - iCarousel's methods

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    return self.myCards.count;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view {
    
    Card *card = [self.myCards objectAtIndex:index];
    
    if (view == nil) {
        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 225.0, 135.0)];
        ((UIImageView *)view).image = [UIImage imageNamed:card.imageName];
        view.contentMode = UIViewContentModeScaleAspectFill;
    }
    
    return view;
}

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel {
    if (self.myCards.count > 0) {
        Card *card = [self.myCards objectAtIndex:carousel.currentItemIndex];
        self.cardNameLabel.text = card.name;
        self.cardNumberLabel.text = card.number;
        NSNumberFormatter *formatter = [NSNumberFormatter new];
        formatter.numberStyle = NSNumberFormatterDecimalStyle;
        self.cardPointsLabel.text = [NSString stringWithFormat:@" %@ points    ", [formatter stringFromNumber:card.points]];
    }
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
