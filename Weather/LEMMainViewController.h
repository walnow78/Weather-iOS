//
//  LEMGeonameViewController.h
//  Weather
//
//  Created by Pawel Walicki on 22/8/15.
//  Copyright (c) 2015 lemurinthebox. All rights reserved.
//

#import "POLCoreDataTableViewController.h"
@class LEMMainViewController;
@class LEMGeolocation;

@protocol MainViewControllerDelegate <NSObject>

-(void) mainViewController:(LEMMainViewController*) mainVC
      geolocationDidChange:(LEMGeolocation*) geolocation;

@end

@interface LEMMainViewController : POLCoreDataTableViewController <MainViewControllerDelegate>

@property(nonatomic,strong) id<MainViewControllerDelegate> delegate;

@end
