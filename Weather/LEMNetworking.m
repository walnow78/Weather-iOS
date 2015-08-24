//
//  LEMNetworking.m
//  Weather
//
//  Created by Pawel Walicki on 22/8/15.
//  Copyright (c) 2015 lemurinthebox. All rights reserved.
//

#import "LEMNetworking.h"
#import <AFNetworking/AFHTTPRequestOperation.h>
#import <AFNetworking/AFNetworking.h>
#import "LEMSettings.h"
#import "LEMGeolocation.h"

@interface LEMNetworking ()

@property(nonatomic,strong) NSMutableArray *temperatures;

@end

@implementation LEMNetworking

+(void) syncTemperatureWithGeolocation:(LEMGeolocation*) geolocation{
    
    NSDictionary *parameters = @{@"north" : [[NSNumber numberWithDouble:geolocation.northValue] stringValue],
                                 @"south" : [[NSNumber numberWithDouble:geolocation.southValue] stringValue],
                                 @"east" : [[NSNumber numberWithDouble:geolocation.eastValue] stringValue],
                                 @"west" : [[NSNumber numberWithDouble:geolocation.westValue] stringValue],
                                 @"username" : API_USER};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:API_URL_WEATHER
      parameters:parameters
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             
             NSArray *weather = [responseObject objectForKey:@"weatherObservations"];
             
             double temperature = 0;
             
             for (NSDictionary *observations in weather) {
                 temperature += [[observations objectForKey:@"temperature"] doubleValue];
             }
             
             if ([weather count] > 0) {
                 temperature = temperature / [weather count];
             }
             
             // Notify the changes
             
             NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
             
             [defaultCenter postNotificationName:TEMPERATURE_DID_CHANGE
                                          object:self
                                        userInfo:@{KEY_TEMPERATURE_NOTIFICATION : @(temperature)}];
             
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             
             NSLog(@"Error api weather: %@", error.localizedDescription);
             
         }];
}


@end
