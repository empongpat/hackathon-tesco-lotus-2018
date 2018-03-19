//
//  AddCardConfirmViewController.h
//  IndiCard
//
//  Created by Pongpat Weesommai on 17/3/18.
//  Copyright © 2018 Pongpat Weesommai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddCardConfirmViewController : UIViewController

@property (strong, nonatomic) NSString *barcodeNumber;
@property (strong, nonatomic) NSString *cardName;
@property (strong, nonatomic) NSString *cardImageName;
@property (strong, nonatomic) NSNumber *cardPoints;

@end
