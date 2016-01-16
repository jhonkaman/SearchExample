//
//  OfficeHoursViewController.m
//  SearchExample
//
//  Created by Javier Alvarado on 1/13/16.
//  Copyright © 2016 Javier Alvarado. All rights reserved.
//

#import "OfficeHoursViewController.h"

@interface OfficeHoursViewController ()

@end

@implementation OfficeHoursViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.testLabel.text = self.professor[@"lastName"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
