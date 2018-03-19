//
//  MyCardsViewController.h
//  Cardlet
//
//  Created by Pongpat Weesommai on 17/3/18.
//  Copyright © 2018 Pongpat Weesommai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>
#import "Card.h"
#import "iCarousel.h"

@interface MyCardsViewController : UIViewController <iCarouselDataSource, iCarouselDelegate>

@property (strong, nonatomic) RLMResults<Card *> *myCards;

@end
