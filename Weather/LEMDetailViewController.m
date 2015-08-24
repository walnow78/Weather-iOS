//
//  LEMDetailViewController.m
//  Weather
//
//  Created by Pawel Walicki on 21/8/15.
//  Copyright (c) 2015 lemurinthebox. All rights reserved.
//

#import "LEMDetailViewController.h"
#import "LEMSettings.h"
#import "LEMGeolocation.h"
#import "LEMAnotation.h"
#import "LEMNetworking.h"

@interface LEMDetailViewController () <CLLocationManagerDelegate, MKMapViewDelegate>

@property(nonatomic) double temperature;
@property(nonatomic,strong) LEMAnotation *point;

@end

@implementation LEMDetailViewController

-(instancetype) initWithModel:(LEMGeolocation*) model{
    
    if (self = [super init]) {
        _model = model;
        self.title = model.name;
    }
    
    return self;
    
}

#pragma mark - Lifecycle

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    [self customSlide];
    
    self.mapView.delegate = self;
    
    [self.temperatureLabel setHidden:YES];
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    [center addObserver:self
               selector:@selector(syncTemperature:)
                   name:TEMPERATURE_DID_CHANGE
                 object:nil];
  
    [self syncViewModel];
    

    
}

- (void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Private

- (void) syncViewModel{

    
    [LEMNetworking syncTemperatureWithGeolocation:self.model];
    
    CLLocationCoordinate2D loc2D;
    
    loc2D.latitude = self.model.latitudeValue;
    loc2D.longitude = self.model.longitudeValue;
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc2D, 150, 150);
    
    [self.mapView setRegion:region animated:YES];
    
    self.point = [[LEMAnotation alloc] initWithTitle:self.model.name
                                                     subtitle:nil
                                                   coordinate:loc2D];
    
    [self.mapView addAnnotation:self.point];
    
}

-(void) customSlide{
    

    [[UISlider appearance] setThumbImage:[UIImage imageNamed:@"RectangleMark.png"]
                                forState:UIControlStateNormal];
    
    [self.sliderView setMinimumTrackImage:[UIImage imageNamed:@"rectangleBlue.png"]
                                 forState:UIControlStateNormal];
    
    [self.sliderView setMaximumTrackImage:[UIImage imageNamed:@"rectangleRed.png"]
                                 forState:UIControlStateNormal];

}

-(void) syncTemperature:(NSNotification*) info{
    
    NSDictionary *dic = [info userInfo];
    
    [self.sliderView setMinimumValue:-50];
    [self.sliderView setMaximumValue:50];
    
    [self.sliderView setValue:-10];
    
    self.temperature = [[dic objectForKey:KEY_TEMPERATURE_NOTIFICATION] doubleValue];
    
    self.point.subtitle = [NSString stringWithFormat:@"Temp: %.02fC", self.temperature];
    
    [UIView animateWithDuration:1
                     animations:^{
                         
                         [self.sliderView setValue:self.temperature
                                          animated:YES];
                         
                         
                     } completion:^(BOOL finished) {
                         
                         self.temperatureLabel.text = [NSString stringWithFormat:@"Temp: %.02fC", self.temperature];
                         [self.temperatureLabel setHidden:NO];
                         
                     }];
    
    [UIView animateWithDuration:1
                     animations:^{
                         self.temperatureLabel.alpha = 1;
                         
                     } completion:^(BOOL finished) {
                         

                         
                     }];
}

#pragma mark - MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    
    static NSString *reuseId = @"reuseId";
    
    MKPinAnnotationView *annotationView = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseId];
    
    if (annotationView == nil) {
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseId];
        annotationView.canShowCallout = YES;
    }
    
    return annotationView;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
