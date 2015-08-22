//
//  LEMSearchTableViewController.m
//  Weather
//
//  Created by Pawel Walicki on 20/8/15.
//  Copyright (c) 2015 lemurinthebox. All rights reserved.
//

#import "LEMSearchTableViewController.h"
#import "LEMSuggestionsTableViewController.h"
#import "LEMDetailViewController.h"

@interface LEMSearchTableViewController () <SuggestionsViewControllerDelegate, UISearchBarDelegate>

@property(nonatomic,strong) UISearchController *searchController;

@end

@implementation LEMSearchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Weather";
    
    UIBarButtonItem *suggestionButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
                                                                                            target:self
                                                                                            action:@selector(showSuggestions)];
    self.navigationItem.rightBarButtonItem = suggestionButton;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Private

-(void) showSuggestions{
 
//    LEMSuggestionsTableViewController *suggestionsVC = [[LEMSuggestionsTableViewController alloc] initWithNavigation:self.navigationController];
//    
//    suggestionsVC.delegate = self;
//    
//    self.searchController = [[UISearchController alloc] initWithSearchResultsController:suggestionsVC];
//    self.searchController.searchResultsUpdater = suggestionsVC;
//    self.searchController.hidesNavigationBarDuringPresentation = NO;
//    self.searchController.searchBar.delegate = self;
//    
//    [self presentViewController:self.searchController animated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1; //[self.lastSearch count];
  
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellId = @"cellId";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
  //  cell.textLabel.text = [self.lastSearch objectAtIndexedSubscript:indexPath.row];
    
    return cell;
    
}

#pragma mark - UITableViewDelegate

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
//    LEMGeoName *current = [self.lastSearch objectAtIndex:indexPath.row];
//    
//    LEMDetailViewController *detailVC = [[LEMDetailViewController alloc] initWithModel:current];
//    
//    [self.navigationController pushViewController:detailVC animated:NO];

    
}

#pragma mark - SuggestionsViewControllerDelegate

-(void) suggestionsViewController:(LEMSuggestionsTableViewController *)viewController didSelectSuggestion:(LEMGeolocation *)suggestion{

  //  [self.tableView reloadData];
    
  //  [self.searchController dismissViewControllerAnimated:YES completion:nil];
    
}



















@end
