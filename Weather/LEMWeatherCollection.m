//
//  LEMWeatherCollection.m
//  Weather
//
//  Created by Pawel Walicki on 21/8/15.
//  Copyright (c) 2015 lemurinthebox. All rights reserved.
//

#import "LEMWeatherCollection.h"
#import <AFNetworking/AFHTTPRequestOperation.h>
#import <AFNetworking/AFNetworking.h>
#import "LEMSettings.h"
#import "LEMWeather.h"

@implementation LEMWeatherCollection

-(instancetype) initWithNorth:(double) north
                        south:(double) south
                         east:(double) east
                         west:(double) west{
    
    if (self = [super init]) {
        _north = north;
        _south = south;
        _east = east;
        _west = west;
        
        self.model = [[NSMutableArray alloc] init];
    }
    
    return self;
}

+(instancetype) weatherWithNorth:(double) north
                           south:(double) south
                            east:(double) east
                            west:(double) west{
    
    return [[LEMWeatherCollection alloc] initWithNorth:north
                                                 south:south
                                                  east:east
                                                  west:west];
    
}
-(void) syncModel{
    
    NSDictionary *parameters = @{@"north" : [[NSNumber numberWithDouble:self.north] stringValue],
                                 @"south" : [[NSNumber numberWithDouble:self.south] stringValue],
                                 @"east" : [[NSNumber numberWithDouble:self.east] stringValue],
                                 @"west" : [[NSNumber numberWithDouble:self.west] stringValue],
                                 @"username" : API_USER};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:API_URL_WEATHER
      parameters:parameters
         success:^(AFHTTPRequestOperation *operation, id responseObject) {

             NSArray *aa = [responseObject objectForKey:@"weatherObservations"];
             
             for (NSDictionary *observations in aa) {
                 
                 LEMWeather *weather = [LEMWeather weatherWithTemperature:[[observations objectForKey:@"temperature"] doubleValue]];

                 [self.model addObject:weather];
                 
             }
             
             // Notify the changes
             
             NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
             
             [defaultCenter postNotificationName:MODEL_TEMPERATURE_DID_CHANGE
                                          object:self
                                        userInfo:nil];
             
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             
             NSLog(@"Error api weather: %@", error.localizedDescription);
             
         }];
}


@end
