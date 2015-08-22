//
//  LEMSuggestion.m
//  Weather
//
//  Created by Pawel Walicki on 22/8/15.
//  Copyright (c) 2015 lemurinthebox. All rights reserved.
//

#import "LEMSuggestion.h"

@implementation LEMSuggestion

-(instancetype) initWithSouth:(double) south
                         east:(double) east
                        north:(double) north
                         west:(double) west
                         name:(NSString*) name
                     latitude:(double) latitude
                    longitude:(double) longitude{
    
    if (self = [super init]) {
        _south = south;
        _east = east;
        _north = north;
        _west = west;
        _name = name;
        _latitude = latitude;
        _longitude = longitude;
    }
    
    return self;
}

+(instancetype) suggestionWithSouth:(double) south
                               east:(double) east
                              north:(double) north
                               west:(double) west
                               name:(NSString*) name
                           latitude:(double) latitude
                          longitude:(double) longitude{
    
    return [[LEMSuggestion alloc] initWithSouth:south
                                           east:east
                                          north:north
                                           west:west
                                           name:name
                                       latitude:latitude
                                      longitude:longitude];
    
}

@end
