//
//  SignInViewController.m
//  IndiCard
//
//  Created by Pongpat Weesommai on 17/3/18.
//  Copyright © 2018 Pongpat Weesommai. All rights reserved.
//

#import "SignInViewController.h"
#import "Constants.h"
@import Firebase;
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface SignInViewController ()

@property (weak, nonatomic) IBOutlet UIView *loadingContainer;
@property (weak, nonatomic) IBOutlet UIButton *signInWithFacebookButton;

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.signInWithFacebookButton.layer.cornerRadius = BUTTON_CORNER_RADIUS;
    self.signInWithFacebookButton.layer.masksToBounds = YES;
    [self.signInWithFacebookButton addTarget:self action:@selector(signInWithFacebookButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (IBAction)signInWithFacebookButton:(UIButton *)signInWithFacebookButton {
    FBSDKLoginManager *login = [FBSDKLoginManager new];
    [login logInWithReadPermissions:@[@"public_profile", @"email"] fromViewController:self handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
            NSLog(@"Process error");
        } else if (result.isCancelled) {
            NSLog(@"Cancelled");
        } else {
            NSLog(@"Logged in");
            self.signInWithFacebookButton.enabled = NO;
            self.loadingContainer.hidden = NO;
            // Sign in with Firebase Auth
            FIRAuthCredential *credential = [FIRFacebookAuthProvider
                                             credentialWithAccessToken:[FBSDKAccessToken currentAccessToken].tokenString];
            [[FIRAuth auth] signInWithCredential:credential completion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
                [self performSegueWithIdentifier:@"showMyCardsViewController" sender:self];
            }];
        }
    }];
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
