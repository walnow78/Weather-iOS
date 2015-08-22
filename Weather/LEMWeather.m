//
//  LEMTemperature.m
//  Weather
//
//  Created by Pawel Walicki on 21/8/15.
//  Copyright (c) 2015 lemurinthebox. All rights reserved.
//

#import "LEMWeather.h"

@implementation LEMWeather

-(instancetype) initWithTemperature:(double) temperature{
    
    if (self = [super init]) {
        _temperature = temperature;
    }
    
    return self;
}

+(instancetype) weatherWithTemperature:(double) temperature{
    
    return [[LEMWeather alloc] initWithTemperature:temperature];
    
}
@end
