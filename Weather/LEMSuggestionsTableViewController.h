//
//  LEMSuggestionsTableViewController.h
//  Weather
//
//  Created by Pawel Walicki on 20/8/15.
//  Copyright (c) 2015 lemurinthebox. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LEMSuggestionsTableViewController;
@class LEMSuggestion;

@protocol SuggestionsViewControllerDelegate <NSObject>

-(void) suggestionsViewController:(LEMSuggestionsTableViewController*) viewController
              didSelectSuggestion:(LEMSuggestion*) suggestion;

@end

@interface LEMSuggestionsTableViewController : UITableViewController <UISearchResultsUpdating>

@property(nonatomic,strong) id<SuggestionsViewControllerDelegate> delegate;

@property(nonatomic,strong) UINavigationController *navigation;
@property(nonatomic,strong) NSManagedObjectContext *context;

-(instancetype) initWithNavigation:(UINavigationController*) navigation
                           context:(NSManagedObjectContext*) context;

@end
