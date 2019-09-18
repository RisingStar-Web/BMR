//
//  ViewController.m
//  BMR
//
//  Created by Evgeniy Mikhaylov on 16.10.13.
//  Copyright (c) 2013 Evgeniy Mikhaylov. All rights reserved.
//

#import "ViewController.h"
#import "InfoViewController.h"
#import "DIViewController.h"
#import "SeeViewController.h"

@interface ViewController (){
    
    BOOL param;
    double result;
    UIBarButtonItem *toolBarButton;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    param = YES;
    
	// Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = NSLocalizedString(@"title1", nil);

    _textFiled1.keyboardType = UIKeyboardTypeDecimalPad;
    _textFiled2.keyboardType = UIKeyboardTypeDecimalPad;
    
    _label1.hidden = YES;
    _label2.hidden = YES;
    _label3.hidden = YES;
    _restart.hidden = YES;
    _seeTable.hidden = YES;
    _diffIndex.hidden = YES;

    boolbar = [UIToolbar new];
    boolbar.barTintColor = [UIColor whiteColor];
    [boolbar sizeToFit];
    UIBarButtonItem *nextButton =[[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"button3", nil) style:UIBarButtonItemStyleDone target:self action:@selector(nextButton)];
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    NSArray *array = [NSArray arrayWithObjects: flexible, nextButton, nil];
    [boolbar setItems:array];
    
    
    toolbar = [UIToolbar new];
    toolbar.barTintColor = [UIColor whiteColor];
    [toolbar sizeToFit];
    toolBarButton =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneBtn1)];
    
    UIBarButtonItem *leftBarButton2 = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"button1", nil) style:UIBarButtonItemStyleDone target:self action:@selector(doneBtn)];
    UIBarButtonItem *leftBarButton =[[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"button2", nil) style:UIBarButtonItemStyleDone target:self action:@selector(info)];
    UIBarButtonItem *flexibleSpace2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    NSArray *barArray2 = [NSArray arrayWithObjects: flexibleSpace2,toolBarButton, nil];
    [toolbar setItems:barArray2];
    
        
    _textFiled1.inputAccessoryView = toolbar;
    _textFiled2.inputAccessoryView = toolbar;

    _textFiled1.delegate = self;
    _textFiled2.delegate = self;

    self.navigationItem.rightBarButtonItem = leftBarButton2;
    self.navigationItem.leftBarButtonItem = leftBarButton;
    
    [_textFiled1 becomeFirstResponder];

}


- (void)nextButton
{
    [_textFiled2 becomeFirstResponder];

}



- (IBAction)restart:(id)sender {
    
    
    _textFiled1.text = @"";
    _textFiled2.text = @"";

    [_textFiled1 becomeFirstResponder];
    
}

- (IBAction)seeTable:(id)sender {
    
    
    SeeViewController *seeData = [self.storyboard instantiateViewControllerWithIdentifier:@"SeeViewController"];
    seeData.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:seeData];
    [self presentViewController:navigationController animated:YES completion:nil];

    
}

- (void)info{
    
    InfoViewController *infoData = [self.storyboard instantiateViewControllerWithIdentifier:@"InfoViewController"];
    infoData.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:infoData];
    [self presentViewController:navigationController animated:YES completion:nil];
    
}


- (IBAction)diffIndex:(id)sender {
    
    DIViewController *diData = [self.storyboard instantiateViewControllerWithIdentifier:@"DIViewController"];
    diData.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:diData];
    
    diData.string1 = _textFiled1.text;
    diData.string2 = _textFiled2.text;

    [self presentViewController:navigationController animated:YES completion:nil];
    
    
}

- (void)brain:(BOOL)parament{
    
    double height;
    double weight;
    result = 0;
    
    //HEIGHT
    NSString *firstString = @",";
    NSString *secondString = _textFiled1.text;
    NSRange range = [secondString rangeOfString:firstString];
    
    if(range.length == 0){
    height = [_textFiled1.text doubleValue]/100;
    }
    else{
        NSString *newField = _textFiled1.text;
        NSString *newString = [newField stringByReplacingOccurrencesOfString:@"," withString:@"."];
        height = [newString doubleValue]/100;
    }
    
    //WEIGHT
    NSString *firstString1 = @",";
    NSString *secondString1 = _textFiled2.text;
    NSRange range1 = [secondString1 rangeOfString:firstString1];
    
    if(range1.length == 0){
        weight = [_textFiled2.text doubleValue];
    }
    else{
        NSString *newField = _textFiled2.text;
        NSString *newString = [newField stringByReplacingOccurrencesOfString:@"," withString:@"."];
        weight = [newString doubleValue];
    }
    
    result = (weight/(height*height));
    
    //NSLog(@"%f %f %f", weight, height, result);
}

- (void)segmentChanged:(id)sender
{
    if([sender selectedSegmentIndex] == 0){
        
        param = YES;
        NSLog(@"12345");
    }
    else if([sender selectedSegmentIndex] == 1){
        
        param = NO;
        NSLog(@"54321");
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    if (textField == _textFiled1){
        _label1.hidden = YES;
        _label2.hidden = YES;
        _label3.hidden = YES;
        _restart.hidden = YES;
        _seeTable.hidden = YES;
        _diffIndex.hidden = YES;


    }
    else if (textField == _textFiled2){
        _label1.hidden = YES;
        _label2.hidden = YES;
        _label3.hidden = YES;
        _restart.hidden = YES;
        _seeTable.hidden = YES;
        _diffIndex.hidden = YES;

    }
    
}

- (void)doneBtn1{
    
    if ([_textFiled1 isEditing]){
        
        [_textFiled2 becomeFirstResponder];
    }
    else if ([_textFiled2 isEditing]){
        
        if ([_textFiled1.text length] == 0){NSLog(@"1");[_textFiled1 becomeFirstResponder];}
        else if ([_textFiled2.text length] == 0){NSLog(@"2");}
        else if ([_textFiled1.text length] > 0 && [_textFiled2.text length] > 0){
            
            NSLog(@"3");
            [_textFiled2 resignFirstResponder];
        
            _label1.hidden = NO;
            _label2.hidden = NO;
            _label3.hidden = NO;
            _restart.hidden = NO;
            _seeTable.hidden = NO;
            _diffIndex.hidden = NO;


            [self brain:param];
            
            
            if (result < 16.0){
                _label2.textColor = [UIColor redColor];
                _label3.textColor = [UIColor redColor];
                _label3.text = NSLocalizedString(@"value1", nil);
            }
            else if (result >= 16.0 && result < 17.0){
                _label2.textColor = [UIColor redColor];
                _label3.textColor = [UIColor redColor];
                _label3.text = NSLocalizedString(@"value2", nil);
            }
            else if (result >= 17.0 && result < 18.5){
                _label2.textColor = [UIColor redColor];
                _label3.textColor = [UIColor redColor];
                _label3.text = NSLocalizedString(@"value3", nil);
            }
            else if (result >= 18.5 && result < 25){
                _label2.textColor = [UIColor greenColor];
                _label3.textColor = [UIColor greenColor];
                _label3.text = NSLocalizedString(@"value4", nil);
            }
            else if (result >= 25 && result < 30){
                _label2.textColor = [UIColor redColor];
                _label3.textColor = [UIColor redColor];
                _label3.text = NSLocalizedString(@"value5", nil);
            }
            else if (result >= 30 && result < 35){
                _label2.textColor = [UIColor redColor];
                _label3.textColor = [UIColor redColor];
                _label3.text = NSLocalizedString(@"value6", nil);
            }
            else if (result >= 35 && result < 40){
                _label2.textColor = [UIColor redColor];
                _label3.textColor = [UIColor redColor];
                _label3.text = NSLocalizedString(@"value7", nil);
            }
            else if (result >= 40){
                _label2.textColor = [UIColor redColor];
                _label3.textColor = [UIColor redColor];
                _label3.text = NSLocalizedString(@"value8", nil);
            }
            
            NSString *string = [NSString stringWithFormat:@"%.2f", result];
            _label2.text = string;
        
                      
        }
        
    }
    
}

- (void)doneBtn{
    
        if ([_textFiled1.text length] == 0){NSLog(@"1");[_textFiled1 becomeFirstResponder];}
        else if ([_textFiled2.text length] == 0){NSLog(@"2");[_textFiled2 becomeFirstResponder];}
        else if ([_textFiled1.text length] > 0 && [_textFiled2.text length] > 0){
            
            NSLog(@"3");
            
            [_textFiled1 resignFirstResponder];
            [_textFiled2 resignFirstResponder];
            
            _label1.hidden = NO;
            _label2.hidden = NO;
            _label3.hidden = NO;
            _restart.hidden = NO;
            _seeTable.hidden = NO;
            _diffIndex.hidden = NO;
            
            [self brain:param];
            
            if (result < 16.0){
                _label2.textColor = [UIColor redColor];
                _label3.textColor = [UIColor redColor];
                _label3.text = NSLocalizedString(@"value1", nil);
            }
            else if (result >= 16.0 && result < 17.0){
                _label2.textColor = [UIColor redColor];
                _label3.textColor = [UIColor redColor];
                _label3.text = NSLocalizedString(@"value2", nil);
            }
            else if (result >= 17.0 && result < 18.5){
                _label2.textColor = [UIColor redColor];
                _label3.textColor = [UIColor redColor];
                _label3.text = NSLocalizedString(@"value3", nil);
            }
            else if (result >= 18.5 && result < 25){
                _label2.textColor = [UIColor greenColor];
                _label3.textColor = [UIColor greenColor];
                _label3.text = NSLocalizedString(@"value4", nil);
            }
            else if (result >= 25 && result < 30){
                _label2.textColor = [UIColor redColor];
                _label3.textColor = [UIColor redColor];
                _label3.text = NSLocalizedString(@"value5", nil);
            }
            else if (result >= 30 && result < 35){
                _label2.textColor = [UIColor redColor];
                _label3.textColor = [UIColor redColor];
                _label3.text = NSLocalizedString(@"value6", nil);
            }
            else if (result >= 35 && result < 40){
                _label2.textColor = [UIColor redColor];
                _label3.textColor = [UIColor redColor];
                _label3.text = NSLocalizedString(@"value7", nil);
            }
            else if (result >= 40){
                _label2.textColor = [UIColor redColor];
                _label3.textColor = [UIColor redColor];
                _label3.text = NSLocalizedString(@"value8", nil);
            }
            
            NSString *string = [NSString stringWithFormat:@"%.2f", result];
            _label2.text = string;
            
        }
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSString *firstString1 = @",";
    NSString *secondString1 = textField.text;
    NSRange range1 = [secondString1 rangeOfString:firstString1];

    if(range1.length == 0){
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return (newLength > 4) ? NO : YES;
    }
    else{
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return (newLength > 5) ? NO : YES;
    }
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
