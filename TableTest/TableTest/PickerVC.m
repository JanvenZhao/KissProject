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

@interface PickerVC ()

@end

@implementation PickerVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _date = [NSMutableArray arrayWithArray:[Utis getDateArraysFromNowWithDays:30]];
        
        _hours = [NSMutableArray arrayWithCapacity:24];
        for (int i = 0; i<24; i++) {
            NSString *value = (i>=10)?[NSString stringWithFormat:@"%d",i]:[NSString stringWithFormat:@"0%d",i];
            [_hours addObject:value];
        }
        
        _mins = [NSMutableArray arrayWithCapacity:6];
        for (int i = 0; i<6; i++) {
            NSString *value = [NSString stringWithFormat:@"%d0",i];
            [_mins addObject:value];
        }
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    _picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 100, 320, 60)];
    _picker.delegate = self;
    _picker.dataSource = self;
    _picker.showsSelectionIndicator = YES;
    
    [self.view addSubview:_picker];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{

    return 3;
    
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    switch (component) {
        case 0:
            return [_date count];
            break;
        case 1:
            return [_hours count];
            break;
         case 2:
            return [_mins count];
            break;
        default:
            break;
    }
    return 0;
}
// returns width of column and height of row for each component.
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    
    return (component == 0)?150:75;
    
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{

    return 40;
    
}

// these methods return either a plain NSString, a NSAttributedString, or a view (e.g UILabel) to display the row for the component.
// for the view versions, we cache any hidden and thus unused views and pass them back for reuse.
// If you return back a different object, the old one will be released. the view will be centered in the row rect
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{

    switch (component) {
        case 0:
            return [_date objectAtIndex:row];
            break;
         case 1:
            return [_hours objectAtIndex:row];
            break;
         case 2:
            return [_mins objectAtIndex:row];
            break;
        default:
            break;
    }
    return nil;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{

    
    
}

@end
