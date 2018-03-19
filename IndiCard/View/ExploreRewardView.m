//
//  ExploreRewardView.m
//  IndiCard
//
//  Created by Pongpat Weesommai on 18/3/18.
//  Copyright © 2018 Pongpat Weesommai. All rights reserved.
//

#import "ExploreRewardView.h"

@implementation ExploreRewardView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (id)init {
    ExploreRewardView *exploreRewardView = nil;
    
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"ExploreRewardView" owner:nil options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:[ExploreRewardView class]]) {
            exploreRewardView = (ExploreRewardView *)object;
            break;
        }
    }
    
    return exploreRewardView;
}

@end
