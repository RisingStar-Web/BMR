//
//  InfoViewController.m
//  BMR
//
//  Created by Evgeniy Mikhaylov on 22.10.13.
//  Copyright (c) 2013 Evgeniy Mikhaylov. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

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
    self.navigationItem.title = NSLocalizedString(@"title2", nil);

    
    UIBarButtonItem *leftBarButton2 = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"button4", nil) style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    
    self.navigationItem.leftBarButtonItem = leftBarButton2;
}

- (void)back{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPP:(id)sender {
    
    //Добавить свою ссылку на политику
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://ссылка на политику конфиденциальности"]];
    
}
@end
