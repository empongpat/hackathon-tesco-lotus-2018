//
//  AddCardManuallyViewController.m
//  IndiCard
//
//  Created by Pongpat Weesommai on 17/3/18.
//  Copyright © 2018 Pongpat Weesommai. All rights reserved.
//

#import "AddCardManuallyViewController.h"
#import "Constants.h"
#import "AddCardConfirmViewController.h"

@interface AddCardManuallyViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UITextField *cardNumberTextField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@end

@implementation AddCardManuallyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.containerView.layer.cornerRadius = CARD_CORNER_RADIUS;
    self.containerView.layer.masksToBounds = YES;
    self.submitButton.layer.cornerRadius = BUTTON_CORNER_RADIUS;
    self.submitButton.layer.masksToBounds = YES;
    
    [self.submitButton addTarget:self action:@selector(submitButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (IBAction)submitButtonClicked:(UIButton *)submitButton {
    if ([self.cardNumberTextField.text isEqualToString:@""]) {
        [self displaySubmitError];
    } else {
        [self performSegueWithIdentifier:@"showConfirmViewController" sender:self];
    }
}

- (void)displaySubmitError {
    UIAlertController *error = [UIAlertController alertControllerWithTitle:@"Error" message:@"Card number cannot be blank!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [error addAction:defaultAction];
    [self presentViewController:error animated:YES completion:nil];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"showConfirmViewController"]) {
        AddCardConfirmViewController *confirmViewController = [segue destinationViewController];
        [confirmViewController setBarcodeNumber:self.cardNumberTextField.text];
        [confirmViewController setCardName:self.cardName];
        [confirmViewController setCardImageName:self.cardImageName];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
