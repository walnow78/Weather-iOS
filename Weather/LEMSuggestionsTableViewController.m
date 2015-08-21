//
//  LEMSuggestionsTableViewController.m
//  Weather
//
//  Created by Pawel Walicki on 20/8/15.
//  Copyright (c) 2015 lemurinthebox. All rights reserved.
//

#import "LEMSuggestionsTableViewController.h"
#import <AFNetworking/AFHTTPRequestOperation.h>
#import <AFNetworking/AFNetworking.h>
#import "LEMSettings.h"

@interface LEMSuggestionsTableViewController ()

@property(nonatomic,strong) NSMutableArray *suggestions;
@property(nonatomic,strong) NSMutableArray *suggestions2;

@end

@implementation LEMSuggestionsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    return [self.suggestions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* cellId = @"cellId";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    cell.textLabel.text = [self.suggestions objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [self.suggestions2 objectAtIndex:indexPath.row];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *currentSuggestion = [self.suggestions objectAtIndex:indexPath.row];
    
    [self.delegate suggestionsViewController:self didSelectSuggestion:currentSuggestion];
    

    

    
}

#pragma mark - UISearchResultsUpdating

-(void) updateSearchResultsForSearchController:(UISearchController *)searchController{
        
        self.suggestions = [NSMutableArray new];
        self.suggestions2 = [NSMutableArray new];
        
        NSDictionary *parameters = @{@"q" : searchController.searchBar.text,
                                     @"maxRows" : @"20",
                                     @"startRow" : @"0",
                                     @"lang" : @"en",
                                     @"isNameRequired" : @"true",
                                     @"style" : @"FULL",
                                     @"username" : API_USER};
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        
        [manager GET:API_URL
          parameters:parameters
             success:^(AFHTTPRequestOperation *operation, id responseObject) {
                 
                 NSDictionary *geonames = [responseObject objectForKey:@"geonames"];
                 
                 for (NSDictionary *dic in geonames) {
                     
                     NSString *countryName = [dic objectForKey:@"countryName"];
                     NSString *asciiName = [dic objectForKey:@"asciiName"];
                     NSString *fcodename = [dic objectForKey:@"fcodeName"];
                     
                     NSString *desc = [NSString stringWithFormat:@"%@ - %@", countryName, asciiName];
                     
                     [self.suggestions addObject:desc];
                     [self.suggestions2 addObject:fcodename];
                     [self.tableView reloadData];
                     
                     
                 }
                 
             } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                 
                 
                 
             }];
    
    
}

@end
