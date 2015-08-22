//
//  LEMTemperature.h
//  Weather
//
//  Created by Pawel Walicki on 21/8/15.
//  Copyright (c) 2015 lemurinthebox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LEMWeather : NSObject

@property(nonatomic) double temperature;

-(instancetype) initWithTemperature:(double) temperature;

+(instancetype) weatherWithTemperature:(double) temperature;

@end
