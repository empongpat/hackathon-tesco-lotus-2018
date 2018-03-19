//
//  Card.h
//  IndiCard
//
//  Created by Pongpat Weesommai on 17/3/18.
//  Copyright © 2018 Pongpat Weesommai. All rights reserved.
//

#import <Realm/Realm.h>

@interface Card : RLMObject

@property NSString *number;
@property NSString *name;
@property NSNumber<RLMInt> *points;
@property NSString *imageName;

@end
