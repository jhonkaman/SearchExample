//
//  FirstTableViewController.m
//  SearchExample
//
//  Created by Javier Alvarado on 1/7/16.
//  Copyright © 2016 Javier Alvarado. All rights reserved.
//

#import "FirstTableViewController.h"
#import "OfficeHoursViewController.h"
#import <Parse/Parse.h>

@interface FirstTableViewController ()

@property (strong, nonatomic) UISearchController *searchController;

@end

@implementation FirstTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Create the search results controller and store a reference to it.
    //self.resultsController = [[ResultsTableViewController alloc] init];
    //self.searchController = [[UISearchController alloc] initWithSearchResultsController:self.resultsController];
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    
    self.searchController.dimsBackgroundDuringPresentation = NO;

    
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
    NSString *searchString = searchController.searchBar.text;
//    //[self searchForText:searchString scope:searchController.searchBar.selectedScopeButtonIndex];
//    
//    //PFQuery *query = [PFQuery queryWithClassName:@"Department"];
//    //[query whereKey:@"Department" containsString:searchString];
//    
//
//    
    self.searchThis = searchString;
//    //[self.resultsController queryForTable];
    [self loadObjects];
    
        //[self queryForTable];
    
        //[self.tableView reloadData];
    
//    if ([searchString isEqualToString:@""]) {
//        [self.resultsController clear];
//    }
}

- (id)initWithCoder:(NSCoder *)aCoder {
    self = [super initWithCoder:aCoder];
    if (self) {
        // The className to query on
        self.parseClassName = @"Professor1";
        
        // The key of the PFObject to display in the label of the default cell style
        self.textKey = @"lastName";
    }
    return self;
}

// Override to customize the query to perform on the class. Default is query for
// all objects ordered by createdAt descending.
- (PFQuery *)queryForTable {
//    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
//    [query orderByAscending:@"lastName"];
//    
//    return query;
    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
    
    if (self.searchThis == NULL || [self.searchThis isEqualToString:@""]) {
        
    } else {
        [query whereKey:@"lastName" containsString:self.searchThis];
        NSLog(@"Hello");
        NSLog(self.searchThis);
    }
    
    [query orderByAscending:@"lastName"];
    
    //self.searchThis = @"0";
    
    return query;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    if ([indexPath row] > self.objects.count -1 ) {
        return;
    } else {
        [self performSegueWithIdentifier:@"showOfficeHoursDetail" sender:self];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
        OfficeHoursViewController *detailViewController = [segue destinationViewController];
        NSInteger row = [[self tableView].indexPathForSelectedRow row];
        //detailViewController.segueType = @"normal";
        detailViewController.professor = [self.objects objectAtIndex:row];
}

@end
