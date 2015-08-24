//
//  LEMSuggestionModel.m
//  Weather
//
//  Created by Pawel Walicki on 22/8/15.
//  Copyright (c) 2015 lemurinthebox. All rights reserved.
//

#import "LEMSuggestionModel.h"
#import <AFNetworking/AFHTTPRequestOperation.h>
#import <AFNetworking/AFNetworking.h>
#import "LEMSuggestion.h"
#import "LEMSettings.h"

@implementation LEMSuggestionModel

-(instancetype) init{
    
    if (self = [super init]) {
        self.model = [[NSMutableArray alloc] init];
    }
    
    return self;
    
}

-(LEMSuggestion*) objectAtIndex:(NSUInteger) index{
    return [self.model objectAtIndex:index];
}

- (NSInteger)count{
    return [self.model count];
}

-(void) syncModelWithText:(NSString*) text{
    
    NSDictionary *parameters = @{@"q" : text,
                                 @"maxRows" : @"20",
                                 @"startRow" : @"0",
                                 @"lang" : @"en",
                                 @"isNameRequired" : @"true",
                                 @"style" : @"FULL",
                                 @"username" : API_USER};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:API_URL_GEONAME
      parameters:parameters
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             
             [self.model removeAllObjects];
             
             NSDictionary *geonames = [responseObject objectForKey:@"geonames"];
             
             for (NSDictionary *dic in geonames) {
                 
                 NSString *countryName = [dic objectForKey:@"countryName"];
                 NSString *asciiName = [dic objectForKey:@"asciiName"];
                 
                 NSDictionary *bbox = [dic objectForKey:@"bbox"];
                 
                 LEMSuggestion *suggestion = [LEMSuggestion suggestionWithCountryId:[[dic objectForKey:@"countryId"] intValue]
                                                                              South:[[bbox objectForKey:@"south"] doubleValue]
                                                                               east:[[bbox objectForKey:@"east"] doubleValue]
                                                                              north:[[bbox objectForKey:@"north"] doubleValue]
                                                                               west:[[bbox objectForKey:@"west"] doubleValue]
                                                                               name:[NSString stringWithFormat:@"%@ - %@", countryName, asciiName]
                                                                           latitude:[[dic objectForKey:@"lat"] doubleValue]
                                                                          longitude:[[dic objectForKey:@"lng"] doubleValue]];
                 
                 [self.model addObject:suggestion];
                 
             }
             
             // Notified the changes
             
             NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
             
             [defaultCenter postNotificationName:MODEL_GEONAME_DID_CHANGE
                                          object:self
                                        userInfo:nil];
             
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             
             
             
         }];
}

@end
