//
//  FirstTableViewController.m
//  SearchExample
//
//  Created by Javier Alvarado on 1/7/16.
//  Copyright © 2016 Javier Alvarado. All rights reserved.
//

#import "FirstTableViewController.h"
#import "ResultsTableViewController.h"
#import <Parse/Parse.h>

@interface FirstTableViewController ()

@property (strong, nonatomic) UISearchController *searchController;
@property (strong, nonatomic) ResultsTableViewController* resultsController;

@end

@implementation FirstTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
//    self.searchController.searchResultsUpdater = self;
//    //self.searchController.dimsBackgroundDuringPresentation = NO;
//    self.searchController.searchBar.scopeButtonTitles = @[NSLocalizedString(@"ScopeButtonCountry",@"Country"),
//                                                          NSLocalizedString(@"ScopeButtonCapital",@"Capital")];
//    self.searchController.searchBar.delegate = self;
//    
//    self.tableView.tableHeaderView = self.searchController.searchBar;
    
    // Create the search results controller and store a reference to it.
    self.resultsController = [[ResultsTableViewController alloc] init];
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:self.resultsController];
    
    // Use the current view controller to update the search results.
    self.searchController.searchResultsUpdater = self;
    
    // Install the search bar as the table header.
    self.tableView.tableHeaderView = self.searchController.searchBar;
    
    self.searchController.searchBar.delegate = self;
    
    // It is usually good to set the presentation context.
    self.definesPresentationContext = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
//    NSString *searchString = searchController.searchBar.text;
//    //[self searchForText:searchString scope:searchController.searchBar.selectedScopeButtonIndex];
//    
//    //PFQuery *query = [PFQuery queryWithClassName:@"Department"];
//    //[query whereKey:@"Department" containsString:searchString];
//    
//
//    
//    self.resultsController.searchThis = searchString;
//    //[self.resultsController queryForTable];
//    [self.resultsController loadObjects];
    
        //[self.tableView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"Test");
    NSString *searchString = searchBar.text;
    //[self searchForText:searchString scope:searchController.searchBar.selectedScopeButtonIndex];
    
    //PFQuery *query = [PFQuery queryWithClassName:@"Department"];
    //[query whereKey:@"Department" containsString:searchString];
    
    
    
    self.resultsController.searchThis = searchString;
    //[self.resultsController queryForTable];
    [self.resultsController loadObjects];
    
    //[self.tableView reloadData];
}

- (void) searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    self.resultsController.searchThis = @"0";
    [self.resultsController loadObjects];
}

- (id)initWithCoder:(NSCoder *)aCoder {
    self = [super initWithCoder:aCoder];
    if (self) {
        // The className to query on
        self.parseClassName = @"Department";
        
        // The key of the PFObject to display in the label of the default cell style
        self.textKey = @"department";
    }
    return self;
}

// Override to customize the query to perform on the class. Default is query for
// all objects ordered by createdAt descending.
- (PFQuery *)queryForTable {
    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
    [query orderByAscending:@"department"];
    
    return query;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
