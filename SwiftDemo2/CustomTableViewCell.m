//
//  CustomTableViewCell.m
//  SwiftDemo2
//
//  Created by Sidney on 14-6-9.
//  Copyright (c) 2014年 iSoftstone infomation Technology (Group) Co.,Ltd. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.pNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 150, 20)];
        self.pNameLabel.backgroundColor = [UIColor orangeColor];
        self.pNameLabel.font = [UIFont systemFontOfSize:16];
        [self addSubview:self.pNameLabel];
        
        self.deadlineLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.pNameLabel.frame), 40, 20)];
        self.deadlineLabel.textAlignment = NSTextAlignmentLeft;
        self.deadlineLabel.backgroundColor = [UIColor clearColor];
        self.deadlineLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:self.deadlineLabel];
        
        self.interestTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, CGRectGetMaxY(self.pNameLabel.frame), 35, 20)];
        self.interestTypeLabel.textAlignment = NSTextAlignmentRight;
        self.interestTypeLabel.backgroundColor = [UIColor clearColor];
        self.interestTypeLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:self.interestTypeLabel];

    }
    return self;
}

@end
