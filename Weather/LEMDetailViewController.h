//
//  LEMDetailViewController.h
//  Weather
//
//  Created by Pawel Walicki on 21/8/15.
//  Copyright (c) 2015 lemurinthebox. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;
@class LEMGeolocation;

@interface LEMDetailViewController : UIViewController

@property(nonatomic,strong) LEMGeolocation *model;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;

-(instancetype) initWithModel:(LEMGeolocation*) model;

@end
