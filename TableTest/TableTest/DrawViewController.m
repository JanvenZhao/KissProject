//
//  DrawViewController.m
//  TableTest
//
//  Created by Jian.Zhao on 14-1-23.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

#import "DrawViewController.h"
#import "DrawCircle.h"

@interface DrawViewController ()

@end

static float progress = 0;

@implementation DrawViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)dealloc{

    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
    NSLog(@"%f",progress);
    progress = 0;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    circle = [[DrawCircle alloc] initWithFrame:CGRectMake(0, 80, 320, 200)];
    circle.maximumValue = 60;
    [self.view addSubview:circle];

//    _timer = [NSTimer timerWithTimeInterval:0.1 target:self selector:@selector(updateTheProgress:) userInfo:nil repeats:YES];
//    [_timer fire];
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateTheProgress:) userInfo:nil repeats:YES];
}

-(void)updateTheProgress:(NSTimer *)timer{

    progress += 1;
    [circle setTheProgressWithGivenValue:progress];
    
    if (progress == 60) {
        [timer invalidate];
        timer = nil;
    }

    NSLog(@"Draw is going -------");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillDisappear:(BOOL)animated{

    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}

@end
