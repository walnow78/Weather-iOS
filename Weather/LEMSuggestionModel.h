//
//  LEMSuggestionModel.h
//  Weather
//
//  Created by Pawel Walicki on 22/8/15.
//  Copyright (c) 2015 lemurinthebox. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LEMSuggestion;

@interface LEMSuggestionModel : NSObject

@property(nonatomic,strong) NSMutableArray *model;

-(instancetype) init;

-(void) syncModelWithText:(NSString*) text;

-(LEMSuggestion*) objectAtIndex:(NSUInteger) index;

-(NSInteger) count;


@end
