//
//  LEMSuggestion.h
//  Weather
//
//  Created by Pawel Walicki on 22/8/15.
//  Copyright (c) 2015 lemurinthebox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LEMSuggestion : NSObject

@property(nonatomic) int geoId;
@property(nonatomic) double south;
@property(nonatomic) double east;
@property(nonatomic) double north;
@property(nonatomic) double west;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *desc;
@property(nonatomic) double longitude;
@property(nonatomic) double latitude;

-(instancetype) initWithGeoId:(int) geoId
                       South:(double) south
                        east:(double) east
                       north:(double) north
                        west:(double) west
                        name:(NSString*) name
                        desc:(NSString*) desc
                    latitude:(double) latitude
                   longitude:(double) longitude;

+(instancetype) suggestionWithGeoId:(int) geoId
                              South:(double) south
                               east:(double) east
                              north:(double) north
                               west:(double) west
                               name:(NSString*) name
                               desc:(NSString*) desc
                           latitude:(double) latitude
                          longitude:(double) longitude;

@end
