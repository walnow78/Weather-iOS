//
//  LEMGeoNameCollection.h
//  Weather
//
//  Created by Pawel Walicki on 21/8/15.
//  Copyright (c) 2015 lemurinthebox. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LEMGeoName;

@interface LEMGeoNameCollection : NSObject

@property(nonatomic,strong) NSMutableArray *model;

-(instancetype) init;

-(void) syncModelWithText:(NSString*) text;

-(LEMGeoName*) objectAtIndex:(NSUInteger) index;

-(NSInteger) count;


@end
