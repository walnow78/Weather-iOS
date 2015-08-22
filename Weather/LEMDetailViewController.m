//
//  LEMDetailViewController.m
//  Weather
//
//  Created by Pawel Walicki on 21/8/15.
//  Copyright (c) 2015 lemurinthebox. All rights reserved.
//

#import "LEMDetailViewController.h"
#import "LEMSettings.h"
#import "LEMWeatherCollection.h"
#import "LEMGeolocation.h"
#import "LEMAnotation.h"

@interface LEMDetailViewController () <CLLocationManagerDelegate, MKMapViewDelegate>

@property(nonatomic,strong) LEMWeatherCollection *weather;

@end

@implementation LEMDetailViewController

-(instancetype) initWithModel:(LEMGeolocation*) model{
    
    if (self = [super init]) {
        _model = model;
    }
    
    return self;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.mapView.delegate = self;
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
//    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
//    
//    [center addObserver:self
//               selector:@selector(syncViewModel)
//                   name:MODEL_TEMPERATURE_DID_CHANGE
//                 object:nil];
//   
//    self.weather = [LEMWeatherCollection weatherWithNorth:self.model.north
//                                                    south:self.model.south
//                                                     east:self.model.east
//                                                     west:self.model.west];
//
//    [self.weather syncModel];
  
    [self syncViewModel];
}
//
- (void) syncViewModel{

    CLLocationCoordinate2D loc2D;
    
    loc2D.latitude = self.model.latitudeValue;
    loc2D.longitude = self.model.longitudeValue;
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc2D, 150, 150);
    
    [self.mapView setRegion:region animated:YES];
    
    LEMAnotation *point = [[LEMAnotation alloc] initWithTitle:self.model.name
                                                     subtitle:self.model.name
                                                   coordinate:loc2D];
    
    
    [self.mapView addAnnotation:point];

    
//    for (LEMWeather *each in self.weather.model) {
//        
//        NSLog(@"temperature: %f", each.temperature);
//        self.temperatureLabel.text = [NSString stringWithFormat:@"Temperature: %f", each.temperature];
//    }
    
}

- (void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    
    static NSString *reuseId = @"reuseId";
    
    MKPinAnnotationView *annotationView = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseId];
    
    if (annotationView == nil) {
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseId];
        
        annotationView.pinColor = MKPinAnnotationColorPurple;
        
        annotationView.canShowCallout = YES;
        
    }
    
    return annotationView;
    
}


@end
