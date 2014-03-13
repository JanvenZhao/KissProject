//
//  FlightCell.m
//  TableTest
//
//  Created by Janven Zhao on 14-3-13.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

#import "FlightCell.h"

@implementation FlightCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)awakeFromNib{

    NSLog(@"-------");

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
