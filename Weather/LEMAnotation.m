//
//  LEMAnotation.m
//  Weather
//
//  Created by Pawel Walicki on 21/8/15.
//  Copyright (c) 2015 lemurinthebox. All rights reserved.
//

#import "LEMAnotation.h"

@implementation LEMAnotation

- (instancetype)initWithTitle:(NSString*) title
                     subtitle:(NSString*) subtitle
                   coordinate:(CLLocationCoordinate2D) coordinate{
    
    if (self = [super init]) {
        
        _title = title;
        _subtitle = subtitle;
        _coordinate = coordinate;
    }
    
    return self;
    
}

@end
