//
//  DIViewController.m
//  BMR
//
//  Created by Evgeniy Mikhaylov on 22.10.13.
//  Copyright (c) 2013 Evgeniy Mikhaylov. All rights reserved.
//

#import "DIViewController.h"

@interface DIViewController ()
{
    //int section;
    UIAlertView *alert1;
    UIAlertView *alert2;
    UIAlertView *alert3;

}

@end

@implementation DIViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.title = NSLocalizedString(@"title3", nil);
    UIBarButtonItem *leftBarButton2 = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"button4", nil) style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = leftBarButton2;
    
    NSLog(@"h = %@", self.string1);
    NSLog(@"w = %@", self.string2);

    height = [self.string1 doubleValue];
    weight = [self.string2 doubleValue];
    
}

- (void)back{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 8;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    double param1; param1 = height*0.7-50;
    double param2; param2 = (weight*1000)/(height*height);
    double param5; param5 = height*420/1000;
    double param6; param6 = height - (100 + (height - 100)/20);
    double param7; param7 = height - 100 - (height - 150)/2;

    if (param0 == 0){
        
         if (indexPath.section == 0){cell.textLabel.text = @"Недостаточно данных (нажми на меня)";cell.textLabel.font = [UIFont systemFontOfSize:14.0];}
    }
    else{
        
         if (indexPath.section == 0){cell.textLabel.text = [NSString stringWithFormat:@"%.1f кг", param0];cell.textLabel.font = [UIFont systemFontOfSize:16.0];}
    }
    
    
    if (indexPath.section == 1){cell.textLabel.text = [NSString stringWithFormat:@"%.1f кг", param1];cell.textLabel.font = [UIFont systemFontOfSize:16.0];}
    
    
    if (param1_2 == 0){

        if (indexPath.section == 2){cell.textLabel.text = @"Недостаточно данных (нажми на меня)";cell.textLabel.font = [UIFont systemFontOfSize:14.0];}
    
    }
    else{
        
        if (indexPath.section == 2){cell.textLabel.text = [NSString stringWithFormat:@"%.1f кг", param1_2];cell.textLabel.font = [UIFont systemFontOfSize:16.0];}
        
    }
    
    if (indexPath.section == 3){cell.textLabel.text = [NSString stringWithFormat:@"%.1f", param2];cell.textLabel.font = [UIFont systemFontOfSize:16.0];}
    
    
    if (param1_3 == 0){
    
    if (indexPath.section == 4){cell.textLabel.text = @"Недостаточно данных (нажми на меня)";cell.textLabel.font = [UIFont systemFontOfSize:14.0];}
    
    }
    else{
        
        if (indexPath.section == 4){cell.textLabel.text = [NSString stringWithFormat:@"%.1f кг", param1_3];cell.textLabel.font = [UIFont systemFontOfSize:16.0];}

    }
    
    if (indexPath.section == 5){cell.textLabel.text = [NSString stringWithFormat:@"%.1f кг", param5];cell.textLabel.font = [UIFont systemFontOfSize:16.0];}
    if (indexPath.section == 6){cell.textLabel.text = [NSString stringWithFormat:@"%.1f кг", param6];cell.textLabel.font = [UIFont systemFontOfSize:16.0];}
    if (indexPath.section == 7){cell.textLabel.text = [NSString stringWithFormat:@"%.1f кг", param7];cell.textLabel.font = [UIFont systemFontOfSize:16.0];}
    
    //NSLog(@"section - %ld", section);
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    switch (section)
    {
        case 0:
            sectionName = NSLocalizedString(@"num1", nil);
            break;
        case 1:
            sectionName = NSLocalizedString(@"num2", nil);
            break;
        case 2:
            sectionName = NSLocalizedString(@"num3", nil);
            break;
        case 3:
            sectionName = NSLocalizedString(@"num4", nil);
            break;
        case 4:
            sectionName = NSLocalizedString(@"num5", nil);
            break;
        case 5:
            sectionName = NSLocalizedString(@"num6", nil);
            break;
        case 6:
            sectionName = NSLocalizedString(@"num7", nil);
            break;
        case 7:
            sectionName = NSLocalizedString(@"num8", nil);
        break;
    
}
    return sectionName;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    
    NSString *footerName;
    switch (section)
    {
        case 0:
            footerName = NSLocalizedString(@"form1", nil);
            break;
        case 1:
            footerName = NSLocalizedString(@"form2", nil);
            break;
        case 2:
            footerName = NSLocalizedString(@"form3", nil);
            break;
        case 3:
            footerName = NSLocalizedString(@"form4", nil);
            break;
        case 4:
            footerName = NSLocalizedString(@"form5", nil);
            break;
        case 5:
            footerName = NSLocalizedString(@"form6", nil);
            break;
        case 6:
            footerName = NSLocalizedString(@"form7", nil);
            break;
        case 7:
            footerName = NSLocalizedString(@"form8", nil);
            break;
    }
    
    return footerName;

    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (indexPath.section == 0){
        
        alert1 = [[UIAlertView alloc] initWithTitle:@"Тип телосложения" message:nil delegate:self cancelButtonTitle:@"Среднее" otherButtonTitles:@"Ширококостное", @"Худощавое", nil];
        
        alert1.alertViewStyle = UIAlertViewStyleDefault;
        
        [alert1 show];
        
    }
    
    else if (indexPath.section == 2){
        
        alert2 = [[UIAlertView alloc] initWithTitle:@"Окружность грудной клетки в сантиметрах" message:nil delegate:self cancelButtonTitle:@"ОК" otherButtonTitles: nil];
        
        alert2.alertViewStyle = UIAlertViewStylePlainTextInput;
        [[alert2 textFieldAtIndex:0] resignFirstResponder];
        [[alert2 textFieldAtIndex:0] setKeyboardType:UIKeyboardTypeDecimalPad];
        [[alert2 textFieldAtIndex:0] becomeFirstResponder];
        
        [alert2 show];
        
    }
    
    else if (indexPath.section == 4){
        
        alert3 = [[UIAlertView alloc] initWithTitle:@"Расстояние от темени до симфиза в сантиметрах" message:nil delegate:self cancelButtonTitle:@"ОК" otherButtonTitles: nil];
        
        alert3.alertViewStyle = UIAlertViewStylePlainTextInput;
        [[alert3 textFieldAtIndex:0] resignFirstResponder];
        [[alert3 textFieldAtIndex:0] setKeyboardType:UIKeyboardTypeDecimalPad];
        [[alert3 textFieldAtIndex:0] becomeFirstResponder];
        
        [alert3 show];
        
    }
    
    else if (indexPath.section == 1 || indexPath.section == 3 || indexPath.section == 5 || indexPath.section == 6){
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [cell setUserInteractionEnabled:NO];
        [self.tableView reloadData];
        
    }
    

}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
   
    if (alertView == alert1){
    
    if (buttonIndex == 0) {
        //Среднее
        NSLog(@"0");
        //double param0;
        param0 = height-100;

    }
    else if (buttonIndex == 1) {
        //Ширококостное
        NSLog(@"1");
        //double param0;
        param0 = height*1.1-100;


    }
    else if (buttonIndex == 2) {
        //Худощавое
        NSLog(@"2");
        //double param0;
        param0 = height*0.9-100;

    }
    }
    
    if (alertView == alert2){
        
        if (buttonIndex == 0) {
            //Среднее
            NSLog(@"5");
            
            double param = [[[alertView textFieldAtIndex:0] text] doubleValue];
            param1_2 = height * param / 240;
        }
    }
    
    if (alertView == alert3){
        
        if (buttonIndex == 0) {
            //Среднее
            NSLog(@"5");
            
            double param = [[[alertView textFieldAtIndex:0] text] doubleValue];
            param1_3 = param * 2 - 100;
        }
    }

    [self.tableView reloadData];
}

@end
