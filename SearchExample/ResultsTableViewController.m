//
//  ResultsTableViewController.m
//  SearchExample
//
//  Created by Javier Alvarado on 1/7/16.
//  Copyright © 2016 Javier Alvarado. All rights reserved.
//

#import "ResultsTableViewController.h"
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
    
    if (self.searchThis == NULL || [self.searchThis isEqualToString:@""]) {
        
    } else {
        [query whereKey:@"department" containsString:self.searchThis];
        NSLog(@"Hello");
        NSLog(self.searchThis);
    }
    
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
