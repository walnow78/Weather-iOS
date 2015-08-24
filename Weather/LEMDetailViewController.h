//
//  LEMDetailViewController.h
//  Weather
//
//  Created by Pawel Walicki on 21/8/15.
//  Copyright (c) 2015 lemurinthebox. All rights reserved.
//

@import UIKit;
@import MapKit;


#import "LEMMainViewController.h"

@class LEMGeolocation;

@interface LEMDetailViewController : UIViewController <UISplitViewControllerDelegate, MainViewControllerDelegate>

@property(nonatomic,strong) LEMGeolocation *model;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UISlider *sliderView;

-(instancetype) initWithModel:(LEMGeolocation*) model;

@end
