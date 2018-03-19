//
//  AddCardScanBarcodeViewController.m
//  IndiCard
//
//  Created by Pongpat Weesommai on 17/3/18.
//  Copyright © 2018 Pongpat Weesommai. All rights reserved.
//

#import "AddCardScanBarcodeViewController.h"
#import "AddCardConfirmViewController.h"
#import "AddCardManuallyViewController.h"
#import "MTBBarcodeScanner.h"

@interface AddCardScanBarcodeViewController ()

@property (weak, nonatomic) IBOutlet UIView *previewView;
@property (weak, nonatomic) IBOutlet UIButton *enterManuallyButton;

@property (weak, nonatomic) NSString *barcodeNumber;
@property (nonatomic, strong) MTBBarcodeScanner *scanner;
@property (nonatomic, strong) NSMutableArray *uniqueCodes;

@end

@implementation AddCardScanBarcodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [MTBBarcodeScanner requestCameraPermissionWithSuccess:^(BOOL success) {
        if (success) {
            
            NSError *error = nil;
            [self.scanner startScanningWithResultBlock:^(NSArray *codes) {
                AVMetadataMachineReadableCodeObject *code = [codes firstObject];
                NSLog(@"Found code: %@", code.stringValue);
                self.barcodeNumber = code.stringValue;
                [self.scanner stopScanning];
                [self performSegueWithIdentifier:@"showConfirmViewController" sender:self];
            } error:&error];
            
        } else {
            // The user denied access to the camera
        }
    }];
}

#pragma mark - Scanner

- (MTBBarcodeScanner *)scanner {
    if (!_scanner) {
        _scanner = [[MTBBarcodeScanner alloc] initWithPreviewView:_previewView];
    }
    return _scanner;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"showConfirmViewController"]) {
        AddCardConfirmViewController *confirmViewController = [segue destinationViewController];
        [confirmViewController setBarcodeNumber:self.barcodeNumber];
        [confirmViewController setCardName:self.cardName];
        [confirmViewController setCardImageName:self.cardImageName];
    }
    else if ([segue.identifier isEqualToString:@"showManualViewController"]) {
        AddCardManuallyViewController *manualViewController = [segue destinationViewController];
        [manualViewController setCardName:self.cardName];
        [manualViewController setCardImageName:self.cardImageName];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
