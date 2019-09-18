//
//  SeeViewController.m
//  BMR
//
//  Created by Evgeniy Mikhaylov on 24.10.13.
//  Copyright (c) 2013 Evgeniy Mikhaylov. All rights reserved.
//

#import "SeeViewController.h"

@interface SeeViewController ()

@end

@implementation SeeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)close:(id)sender {
    
        [self dismissViewControllerAnimated:YES completion:nil];
}
@end
