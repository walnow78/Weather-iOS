//
//  LEMSuggestion.m
//  Weather
//
//  Created by Pawel Walicki on 22/8/15.
//  Copyright (c) 2015 lemurinthebox. All rights reserved.
//

#import "LEMSuggestion.h"

@implementation LEMSuggestion

-(instancetype) initWithGeoId:(int) geoId
                        South:(double) south
                         east:(double) east
                        north:(double) north
                         west:(double) west
                         name:(NSString*) name
                         desc:(NSString*) desc
                     latitude:(double) latitude
                    longitude:(double) longitude{
    
    if (self = [super init]) {
        _geoId = geoId;
        _south = south;
        _east = east;
        _north = north;
        _west = west;
        _name = name;
        _desc = desc;
        _latitude = latitude;
        _longitude = longitude;
    }
    
    return self;
}

+(instancetype) suggestionWithGeoId:(int) geoId
                              South:(double) south
                               east:(double) east
                              north:(double) north
                               west:(double) west
                               name:(NSString*) name
                               desc:(NSString*) desc
                           latitude:(double) latitude
                          longitude:(double) longitude{
    
    return [[LEMSuggestion alloc] initWithGeoId:geoId
                                          South:south
                                           east:east
                                          north:north
                                           west:west
                                           name:name
                                           desc:desc
                                       latitude:latitude
                                      longitude:longitude];
    
}

@end
