//
//  CustomPicker.m
//  TableTest
//
//  Created by Jian.Zhao on 14-3-12.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

#import "CustomPicker.h"
#import "Utis.h"

@implementation CustomPicker

- (id)initWithFrame:(CGRect)frame Delegate:(id)aDelegate
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        _delegate = aDelegate;
        
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
        
        
        UIView *accessory = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
        accessory.backgroundColor = [UIColor whiteColor];
        
        for (int i = 0; i<2; i++) {
            CGRect btnFrame = CGRectMake(i*280, 0, 40, 40);
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setFrame:btnFrame];
            if (i==0) {
                [btn setTitle:@"取消" forState:UIControlStateNormal];
            }else{
                [btn setTitle:@"完成" forState:UIControlStateNormal];
            }
            //[btn setTitleColor:RGBCOLOR(22, 126, 251, 1) forState:UIControlStateNormal];
            btn.tag = 1000+i;
            [btn addTarget:self action:@selector(taptheAccessoryButton:) forControlEvents:UIControlEventTouchUpInside];
            [accessory addSubview:btn];
        }
        
        [self   addSubview:accessory];
        //[accessory release];
        
        UIPickerView *_picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 40, 320, 216)];
        _picker.delegate = self;
        _picker.dataSource = self;
        _picker.showsSelectionIndicator = YES;
        

        [self addSubview:_picker];
       // [picker release];

        
        
    }
    return self;
}


-(void)taptheAccessoryButton:(UIButton *)sender{
    
    int tag = sender.tag;
    if (tag == 1001){
        
        if (_delegate && [_delegate respondsToSelector:@selector(doneTheActionWithResult:)]) {
            // [_delegate doneTheActionWithResult:<#(NSString *)#>];
        }
        
    }
    if (_delegate && [_delegate respondsToSelector:@selector(dismissTheActionSheet)]) {
        [_delegate dismissTheActionSheet];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

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
