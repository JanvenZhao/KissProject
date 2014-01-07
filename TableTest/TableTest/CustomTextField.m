//
//  CustomTextField.m
//  TableTest
//
//  Created by Janven Zhao on 14-1-5.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

#import "CustomTextField.h"
#import "CTField.h"
#import "CTButton.h"

@interface CustomTextField ()

@end

@implementation CustomTextField

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
    
    
    UIView *accessory = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    accessory.backgroundColor = [UIColor redColor];
    
    //_textField.inputView  =accessory;
    //_textField.inputAccessoryView = accessory;
    
    _textField = [[CTField alloc] initWithFrame:CGRectMake(20, 50, 280, 40)];
    _textField.placeholder = @"新建一项";
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    _textField.textAlignment = NSTextAlignmentLeft;
    _textField.delegate = self;
   
    _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    UIImageView *imgv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qq.png"]];//23*23.5
    _textField.leftView = imgv;
    _textField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_textField];
    
    
    btn = [CTButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setFrame:CGRectMake(10, 150, 300, 50)];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 260)];
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 100, 0, 0)];
    [btn setImage:[UIImage imageNamed:@"qq.png"] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [btn setTitle:@"dasdasdasdasdasdadasdasdasdhjsadgfjkhsgFDJKHSADGFJKHSDAGFJKAGSDFJKHGASDHJFKGAKSJDGajkhgs" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField{

    [btn setTitle:textField.text forState:UIControlStateNormal];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
