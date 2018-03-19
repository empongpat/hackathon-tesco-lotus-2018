//
//  Promotion.h
//  IndiCard
//
//  Created by Pongpat Weesommai on 18/3/18.
//  Copyright © 2018 Pongpat Weesommai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Promotion : NSObject

@property NSString *code;
@property NSString *category;
@property NSNumber *originalPrice;
@property NSNumber *salePrice;
@property NSString *promotionDescription;
@property NSString *imageUrl;

@end
