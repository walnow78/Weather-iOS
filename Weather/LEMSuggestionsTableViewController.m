//
//  LEMSuggestionsTableViewController.m
//  Weather
//
//  Created by Pawel Walicki on 20/8/15.
//  Copyright (c) 2015 lemurinthebox. All rights reserved.
//

#import "LEMSuggestionsTableViewController.h"
#import "LEMSettings.h"
#import "LEMSuggestion.h"
#import "LEMSuggestionModel.h"
#import "LEMDetailViewController.h"
#import "LEMMainViewController.h"

#import "LEMGeolocation.h"

@interface LEMSuggestionsTableViewController () 

@property(nonatomic,strong) LEMSuggestionModel *model;

@end

@implementation LEMSuggestionsTableViewController

-(instancetype) initWithcontext:(NSManagedObjectContext*) context;{
    
    if (self = [super initWithNibName:nil bundle:nil]) {
        _context = context;
        
    }
    
    return self;
}

#pragma mark - lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    self.model = [LEMSuggestionModel new];
    
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    [center addObserver:self
               selector:@selector(syncViewModel)
                   name:MODEL_GEONAME_DID_CHANGE
                 object:nil];
    
}

- (void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void) syncViewModel{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.model count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* cellId = @"cellId";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    LEMSuggestion *current = [self.model objectAtIndex:indexPath.row];
    
    cell.textLabel.text = current.name;
    cell.detailTextLabel.text = current.desc;
    
    return cell;
}

#pragma mark - UITableDataView

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LEMSuggestion *current = [self.model objectAtIndex:indexPath.row];
    
    LEMGeolocation *loc = [LEMGeolocation geolocationWithName:current.name
                                                         desc:current.desc
                                                          latitude:current.latitude
                                                         longitude:current.longitude
                                                             south:current.south
                                                             north:current.north
                                                              east:current.east
                                                              west:current.west
                                                           context:self.context];
    
    [self.delegate suggestionsViewController:self didSelectSuggestion:loc];
    
}

#pragma mark - UISearchResultsUpdating

-(void) updateSearchResultsForSearchController:(UISearchController *)searchController{

    [self.model syncModelWithText:searchController.searchBar.text];
}

@end
