//
//  CustomTableViewCell.h
//  SwiftDemo2
//
//  Created by Sidney on 14-6-9.
//  Copyright (c) 2014年 iSoftstone infomation Technology (Group) Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (nonatomic , strong) UILabel * pNameLabel;//产品名称
@property (nonatomic , strong) UILabel * deadlineLabel;//期限
@property (nonatomic , strong) UILabel * interestTypeLabel;//付息方式


@end
