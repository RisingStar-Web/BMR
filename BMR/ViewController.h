//
//  ViewController.h
//  BMR
//
//  Created by Evgeniy Mikhaylov on 16.10.13.
//  Copyright (c) 2013 Evgeniy Mikhaylov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>{
    UIToolbar *boolbar;
    UIToolbar *toolbar;
}

@property (weak, nonatomic) IBOutlet UITextField *textFiled1;
@property (weak, nonatomic) IBOutlet UITextField *textFiled2;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UIButton *diffIndex;
@property (weak, nonatomic) IBOutlet UIButton *restart;
@property (weak, nonatomic) IBOutlet UIButton *seeTable;

- (IBAction)restart:(id)sender;
- (IBAction)seeTable:(id)sender;
- (IBAction)diffIndex:(id)sender;

- (void)brain:(BOOL)parament;

@end
