//
//  PickerVC.m
//  TableTest
//
//  Created by Jian.Zhao on 14-3-7.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

#import "PickerVC.h"
#import "Utis.h"
#import <CoreText/CoreText.h>
#import "CustomPicker.h"


@interface PickerVC ()

@end

@implementation PickerVC

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
    
    UIActionSheet * sheet = [[UIActionSheet alloc] initWithTitle:@"\n\n\n\n\n\n\n\n\n\n\n\n\n"
                                                        delegate:self
                                               cancelButtonTitle:nil
                                          destructiveButtonTitle:nil
                                               otherButtonTitles:nil,nil];
    
    [sheet addSubview: [[CustomPicker alloc] initWithFrame:CGRectMake(0, 0, 320, 256) Delegate:self]];
    [sheet   showInView:self.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
