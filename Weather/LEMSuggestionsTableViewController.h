//
//  LEMSuggestionsTableViewController.h
//  Weather
//
//  Created by Pawel Walicki on 20/8/15.
//  Copyright (c) 2015 lemurinthebox. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LEMSuggestionsTableViewController;
@class LEMGeolocation;


@protocol SuggestionsViewControllerDelegate <NSObject>

-(void) suggestionsViewController:(LEMSuggestionsTableViewController*) viewController
              didSelectSuggestion:(LEMGeolocation*) suggestion;

@end

@interface LEMSuggestionsTableViewController : UITableViewController <UISearchResultsUpdating>

@property(nonatomic,strong) id<SuggestionsViewControllerDelegate> delegate;

@property(nonatomic,strong) UINavigationController *navigation;
@property(nonatomic,strong) NSManagedObjectContext *context;

-(instancetype) initWithcontext:(NSManagedObjectContext*) context;

@end
