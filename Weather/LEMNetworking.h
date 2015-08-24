//
//  LEMNetworking.h
//  Weather
//
//  Created by Pawel Walicki on 22/8/15.
//  Copyright (c) 2015 lemurinthebox. All rights reserved.
//

@import Foundation;
@class LEMGeolocation;

@interface LEMNetworking : NSObject

+(void) syncTemperatureWithGeolocation:(LEMGeolocation*) geolocation;

@end
