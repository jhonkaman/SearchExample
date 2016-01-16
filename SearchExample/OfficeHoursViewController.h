//
//  OfficeHoursViewController.h
//  SearchExample
//
//  Created by Javier Alvarado on 1/13/16.
//  Copyright © 2016 Javier Alvarado. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface OfficeHoursViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@property (strong, nonatomic) PFObject *professor;

@end
