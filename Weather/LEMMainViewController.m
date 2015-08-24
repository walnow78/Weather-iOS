//
//  LEMGeonameViewController.m
//  Weather
//
//  Created by Pawel Walicki on 22/8/15.
//  Copyright (c) 2015 lemurinthebox. All rights reserved.
//

#import "LEMMainViewController.h"
#import "LEMSuggestionsTableViewController.h"
#import "LEMGeolocation.h"
#import "LEMDetailViewController.h"

@interface LEMMainViewController () <SuggestionsViewControllerDelegate, UISearchBarDelegate>

@property(nonatomic,strong) UISearchController *searchController;
@property(nonatomic,strong) LEMSuggestionsTableViewController *suggestion;

@end

@implementation LEMMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Weather";
    
    UIBarButtonItem *suggestionButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
                                                                                      target:self
                                                                                      action:@selector(showSuggestions)];
    self.navigationItem.rightBarButtonItem = suggestionButton;
    

}

-(void) showSuggestions{
    
    LEMSuggestionsTableViewController *suggestionsVC = [[LEMSuggestionsTableViewController alloc] initWithcontext:self.fetchedResultsController.managedObjectContext];
    
    suggestionsVC.delegate = self;
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:suggestionsVC];
    self.searchController.searchResultsUpdater = suggestionsVC;
    self.searchController.hidesNavigationBarDuringPresentation = NO;
    self.searchController.searchBar.delegate = self;
    
    [self presentViewController:self.searchController animated:YES completion:nil];
}


-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellId = @"cellId";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    LEMGeolocation *current = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = current.name;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
    
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LEMGeolocation *current = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Notify to delegate
    
    [self.delegate mainViewController:self
                 geolocationDidChange:current];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SuggestionsViewControllerDelegate

-(void) suggestionsViewController:(LEMSuggestionsTableViewController *)viewController didSelectSuggestion:(LEMGeolocation *)suggestion{
    
    [self.tableView reloadData];
    
    [self.searchController dismissViewControllerAnimated:YES completion:nil];
    
    LEMDetailViewController *detailVC = [[LEMDetailViewController alloc] initWithModel:suggestion];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        [self.delegate mainViewController:self
                     geolocationDidChange:suggestion];
    }else{
        [self.navigationController pushViewController:detailVC animated:NO];
    }
}

#pragma mark - MainViewControllerDelegate

-(void) mainViewController:(LEMMainViewController *)mainVC geolocationDidChange:(LEMGeolocation *)geolocation{

    LEMDetailViewController *detailVC = [[LEMDetailViewController alloc] initWithModel:geolocation];

    [self.navigationController pushViewController:detailVC animated:NO];
    
}



@end
