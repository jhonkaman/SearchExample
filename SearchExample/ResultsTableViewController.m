//
//  ResultsTableViewController.m
//  SearchExample
//
//  Created by Javier Alvarado on 1/7/16.
//  Copyright © 2016 Javier Alvarado. All rights reserved.
//

#import "ResultsTableViewController.h"
#import "OfficeHoursViewController.h"
#import <Parse/Parse.h>

@interface ResultsTableViewController ()

@end

@implementation ResultsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (id)initWithCoder:(NSCoder *)aCoder {
//    self = [super initWithCoder:aCoder];
//    if (self) {
//        // The className to query on
//        self.parseClassName = @"Department";
//        
//        // The key of the PFObject to display in the label of the default cell style
//        self.textKey = @"department";
//    }
//    return self;
//}

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
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

- (void) viewDidDisappear:(BOOL)animated {
    [self clear];
    NSLog(@"Disappear");
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
//    if ([indexPath row] > self.objects.count -1 ) {
//        return;
//    } else {
//        [self performSegueWithIdentifier:@"showOfficeHoursDetail" sender:self];
//    }
//}
//
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//        OfficeHoursViewController *detailViewController = [segue destinationViewController];
//        NSInteger row = [[self tableView].indexPathForSelectedRow row];
//        //detailViewController.segueType = @"normal";
//        //detailViewController.professor = [self.objects objectAtIndex:row]
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
