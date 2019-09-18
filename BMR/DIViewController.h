//
//  DIViewController.h
//  BMR
//
//  Created by Evgeniy Mikhaylov on 22.10.13.
//  Copyright (c) 2013 Evgeniy Mikhaylov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DIViewController : UITableViewController
{
    double height;
    double weight;
    double param0;
    double param1_2;
    double param1_3;

    NSString *string;
}

@property (nonatomic, retain) IBOutlet NSString *string1;
@property (nonatomic, retain) IBOutlet NSString *string2;


@end
