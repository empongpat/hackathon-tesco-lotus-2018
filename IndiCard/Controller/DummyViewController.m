//
//  DummyViewController.m
//  IndiCard
//
//  Created by Pongpat Weesommai on 17/3/18.
//  Copyright © 2018 Pongpat Weesommai. All rights reserved.
//

#import "DummyViewController.h"
@import Firebase;
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface DummyViewController ()

@end

@implementation DummyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // User is logged in
    if ([FBSDKAccessToken currentAccessToken]) {
        if ([FIRAuth auth].currentUser) {
            [self performSegueWithIdentifier:@"skipToMyCardsViewController" sender:self];
        } else {
            // Sign in with Firebase Auth
            FIRAuthCredential *credential = [FIRFacebookAuthProvider
                                             credentialWithAccessToken:[FBSDKAccessToken currentAccessToken].tokenString];
            [[FIRAuth auth] signInWithCredential:credential completion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
                [self performSegueWithIdentifier:@"skipToMyCardsViewController" sender:self];
            }];
        }
    } else {
        [self performSegueWithIdentifier:@"showSignInViewController" sender:self];
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
