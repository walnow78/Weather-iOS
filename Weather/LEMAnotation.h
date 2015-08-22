//
//  LEMAnotation.h
//  Weather
//
//  Created by Pawel Walicki on 21/8/15.
//  Copyright (c) 2015 lemurinthebox. All rights reserved.
//

@import Foundation;
@import MapKit;

@interface LEMAnotation : NSObject <MKAnnotation>

@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *subtitle;
@property(nonatomic,readonly) CLLocationCoordinate2D coordinate;

- (instancetype)initWithTitle:(NSString*) title
                     subtitle:(NSString*) subtitle
                   coordinate:(CLLocationCoordinate2D) coordinate;

@end
