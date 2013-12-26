//
//  CustomCell.m
//  TableTest
//
//  Created by 艺龙员工 on 13-12-21.
//  Copyright (c) 2013年 艺龙员工. All rights reserved.
//

#import "CustomCell.h"

// Cell的宽度取决于下面所设
#define CELL_WIDTH 220
#define CELL_HEIGHT 44
#define RIGHT_DIS_WIDTH 50

@implementation CustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier WithResetDelete:(BOOL)reset
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        if (reset) {
            //
            right_display = [[UIView alloc] initWithFrame:CGRectMake(CELL_WIDTH, 0, RIGHT_DIS_WIDTH, CELL_HEIGHT)];
            right_display.backgroundColor = [UIColor redColor];
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setFrame:right_display.frame];
            [btn addTarget:self action:@selector(tapTheDele) forControlEvents:UIControlEventTouchUpInside];
            [right_display addSubview:btn];
            
            [self addSubview:right_display];
            
            delete_display = NO;//默认不显示
            self.textLabelScrollowed = YES;
            
            UISwipeGestureRecognizer *gesture_left = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleTheSwip:)];
            gesture_left.direction = UISwipeGestureRecognizerDirectionLeft;
            gesture_left.numberOfTouchesRequired = 1;
            gesture_left.delegate = self;
            [self addGestureRecognizer:gesture_left];
            
            UISwipeGestureRecognizer *gesture_right = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleTheSwip:)];
            gesture_right.direction = UISwipeGestureRecognizerDirectionRight;
            gesture_right.numberOfTouchesRequired = 1;
            gesture_right.delegate = self;
            [self addGestureRecognizer:gesture_right];
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTheTap:)];
            tap.numberOfTouchesRequired = 1;
            tap.delegate = self;
            [self addGestureRecognizer:tap];
            
        }
        
    }
    return self;
}

-(void)tapTheDele{

    NSLog(@"detech The Btn Pressed !");
    
}


-(void)configTheCellWithDeleteViewIsDisplay:(BOOL)dis Reset:(BOOL)reset{
    
    
    [UIView animateWithDuration:0.25 animations:^{
        
        CGRect frame = self.frame;
        /**
            若reset为true，直接恢复默认值
            若reset为false，判断dis，为True，偏移 为false，不偏移
         */
        if (!reset) {
            if (dis) {
                //已经偏移的不作处理
                if (frame.origin.x >= 0) {
                    
                    if (self.textLabelScrollowed) {
                        frame.origin.x -= RIGHT_DIS_WIDTH;
                        frame.size.width +=RIGHT_DIS_WIDTH;
                    }else{
                        //将View拉进来
                        CGRect rect = right_display.frame;
                        rect.origin.x -= RIGHT_DIS_WIDTH;
                        [right_display setFrame:rect];
                    }
                    
                }
            }else{
                if (self.textLabelScrollowed) {
                    frame.origin.x = 0;
                }else{
                    //将View拉出去
                    CGRect rect = right_display.frame;
                    rect.origin.x = CELL_WIDTH;
                    [right_display setFrame:rect];
                }
            }
        }else{
            //重置
            if (self.textLabelScrollowed) {
                frame.origin.x = 0;
            }else{
                CGRect rect = right_display.frame;
                rect.origin.x = CELL_WIDTH;
                [right_display setFrame:rect];
            }
            
        }
        [self setFrame:frame];
        
    } completion:^(BOOL finished){
        //do something
    }];
}

-(void)handleTheTap:(UITapGestureRecognizer *)tap{

    CGPoint x = [tap locationInView:right_display];
    if (x.x > 0 && x.x < right_display.frame.size.width) {
        NSLog(@"Do SomeThing !");
    }else{
        delete_display = NO;
        [self configTheCellWithDeleteViewIsDisplay:delete_display Reset:YES];
    }
}


-(void)handleTheSwip:(UISwipeGestureRecognizer *)ges{

    if (delete_display) {
        if (ges.direction == UISwipeGestureRecognizerDirectionRight) {
            delete_display = NO;
        }
    }else{
        delete_display = YES;
    }
    [self configTheCellWithDeleteViewIsDisplay:delete_display Reset:NO];

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    //[super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
