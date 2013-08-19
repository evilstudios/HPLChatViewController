//
//  HPLChatHeaderTableViewCell.m
//  HPLChatTableViewExample
//
//  Created by Александр Баринов on 10/7/12.
//  Copyright (c) 2012 Stex Group. All rights reserved.
//

#import "HPLChatHeaderTableViewCell.h"

@interface HPLChatHeaderTableViewCell ()

@property (nonatomic, retain) UILabel *label;

@end

@implementation HPLChatHeaderTableViewCell

@synthesize label = _label;
@synthesize date = _date;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ( self ) {
        self.contentView.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

+ (CGFloat)height
{
    return 28.0;
}

- (void)setDate:(NSDate *)value
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    NSString *text = [dateFormatter stringFromDate:value];
    
    if (self.label)
    {
        self.label.text = text;
        return;
    }
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, [HPLChatHeaderTableViewCell height])];
    self.label.text = text;
    self.label.font = [UIFont boldSystemFontOfSize:12];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.shadowOffset = CGSizeMake(0, 1);
    self.label.shadowColor = [UIColor clearColor];
    self.label.textColor = [UIColor whiteColor];
    self.label.backgroundColor = [UIColor clearColor];
    [self addSubview:self.label];
}

@end
