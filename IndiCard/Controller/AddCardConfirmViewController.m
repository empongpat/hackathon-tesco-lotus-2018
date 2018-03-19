//
//  AddCardConfirmViewController.m
//  IndiCard
//
//  Created by Pongpat Weesommai on 17/3/18.
//  Copyright © 2018 Pongpat Weesommai. All rights reserved.
//

#import "AddCardConfirmViewController.h"
#import "Constants.h"

@interface AddCardConfirmViewController ()

@property (weak, nonatomic) IBOutlet UIButton *cardButton;
@property (weak, nonatomic) IBOutlet UILabel *cardNameLabel;
@property (weak, nonatomic) IBOutlet UIView *cardInfoView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *cardNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *pointsLabel;

@property NSUserDefaults *defaults;

@property NSString *pointsFormatString;

@end

@implementation AddCardConfirmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.cardInfoView.layer.cornerRadius = CARD_CORNER_RADIUS;
    self.cardInfoView.layer.masksToBounds = YES;
    self.pointsLabel.layer.cornerRadius = POINT_CORNER_RADIUS;
    self.pointsLabel.layer.masksToBounds = YES;
    self.pointsFormatString = @" points    ";
    self.defaults = [NSUserDefaults standardUserDefaults];
    [self.cardButton setBackgroundImage:[UIImage imageNamed:self.cardImageName] forState:UIControlStateNormal];
    self.cardNameLabel.text = self.cardName;
    self.nameLabel.text = [self.defaults stringForKey:NAME_KEY];
    self.cardNumberLabel.text = self.barcodeNumber;
    
    // Point depends on Card
    
    NSString *barcodeCompany = [self.barcodeNumber substringWithRange:NSMakeRange(0, 4)];
    
    if ([barcodeCompany isEqualToString:TESCO_LOTUS_CLUB_CARD]) {
        self.cardPoints = [NSNumber numberWithInt:203];
        self.pointsLabel.text = [NSString stringWithFormat:@" %@%@", @"203", self.pointsFormatString];
    }
    else if ([barcodeCompany isEqualToString:BIG_CARD]) {
        self.cardPoints = [NSNumber numberWithInt:4525];
        self.pointsLabel.text = [NSString stringWithFormat:@" %@%@", @"4,525", self.pointsFormatString];
    }
    else {
        self.cardPoints = [NSNumber numberWithInt:1000];
        self.pointsLabel.text = [NSString stringWithFormat:@" %@%@", @"1,000", self.pointsFormatString];
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
