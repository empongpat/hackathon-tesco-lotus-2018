//
//  AddCardViewController.m
//  IndiCard
//
//  Created by Pongpat Weesommai on 17/3/18.
//  Copyright © 2018 Pongpat Weesommai. All rights reserved.
//

#import "AddCardViewController.h"
#import "AddCardScanBarcodeViewController.h"

@interface AddCardViewController ()

@property (weak, nonatomic) IBOutlet UIButton *tescoLotusCardButton;
@property (weak, nonatomic) IBOutlet UILabel *tescoLotusCardLabel;
@property (weak, nonatomic) IBOutlet UIButton *bigCardButton;
@property (weak, nonatomic) IBOutlet UILabel *bigCardLabel;
@property (weak, nonatomic) IBOutlet UIButton *ikeaFamilyButton;
@property (weak, nonatomic) IBOutlet UILabel *ikeaFamilyLabel;

@property NSString *selectedCardImageName, *selectedCardName;

@end

@implementation AddCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tescoLotusCardButton addTarget:self action:@selector(cardClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.bigCardButton addTarget:self action:@selector(cardClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.ikeaFamilyButton addTarget:self action:@selector(cardClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (IBAction)cardClicked:(UIButton *)cardButton {
    NSInteger buttonTag = cardButton.tag;
    switch (buttonTag) {
        case 1:
            self.selectedCardImageName = @"tesco_lotus_club_card";
            self.selectedCardName = @"Tesco Lotus Club Card";
            break;
        case 2:
            self.selectedCardImageName = @"big_card";
            self.selectedCardName = @"Big Card";
            break;
        case 3:
            self.selectedCardImageName = @"ikea_family";
            self.selectedCardName = @"Ikea Family";
            break;
        default:
            break;
    }
    [self performSegueWithIdentifier:@"showScanBarcodeViewController" sender:self];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"showScanBarcodeViewController"]) {
        AddCardScanBarcodeViewController *scanBarcodeViewController = [segue destinationViewController];
        [scanBarcodeViewController setCardImageName:self.selectedCardImageName];
        [scanBarcodeViewController setCardName:self.selectedCardName];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
