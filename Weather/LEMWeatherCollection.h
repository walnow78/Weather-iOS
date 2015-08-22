//
//  LEMWeatherCollection.h
//  Weather
//
//  Created by Pawel Walicki on 21/8/15.
//  Copyright (c) 2015 lemurinthebox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LEMWeatherCollection : NSObject

@property(nonatomic,strong) NSMutableArray *model;

@property(nonatomic) double north;
@property(nonatomic) double south;
@property(nonatomic) double east;
@property(nonatomic) double west;

-(instancetype) initWithNorth:(double) north
                        south:(double) south
                         east:(double) east
                         west:(double) west;

+(instancetype) weatherWithNorth:(double) north
                           south:(double) south
                            east:(double) east
                            west:(double) west;


-(void) syncModel;

@end
