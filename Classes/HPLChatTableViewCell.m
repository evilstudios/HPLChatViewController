//
//  HPLChatTableViewCell.m
//
//  Created by Alex Barinov
//
//  This work is licensed under the Creative Commons Attribution-ShareAlike 3.0 Unported License.
//  To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/
//

#import <QuartzCore/QuartzCore.h>
#import "HPLChatTableViewCell.h"
#import "HPLChatData.h"

@interface HPLChatTableViewCell ()

@property (nonatomic, retain) UIView *customView;
@property (nonatomic, retain) UIImageView *chatImage;
@property (nonatomic, retain) UIImageView *avatarImage;

- (void) setupInternalData;

@end

@implementation HPLChatTableViewCell

@synthesize data = _data;
@synthesize customView = _customView;
@synthesize chatImage = _chatImage;
@synthesize showAvatar = _showAvatar;
@synthesize avatarImage = _avatarImage;
@synthesize showBubble = _showBubble;

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
	[self setupInternalData];
}

#if !__has_feature(objc_arc)
- (void) dealloc
{
    self.data = nil;
    self.customView = nil;
    self.chatImage = nil;
    self.avatarImage = nil;
    [super dealloc];
}
#endif

- (void)setDataInternal:(HPLChatData *)value
{
	self.data = value;
	[self setupInternalData];
}

- (void) setupInternalData
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (self.showBubble && !self.chatImage)
    {
#if !__has_feature(objc_arc)
        self.chatImage = [[[UIImageView alloc] init] autorelease];
#else
        self.chatImage = [[UIImageView alloc] init];        
#endif
        [self addSubview:self.chatImage];
    }
    
    HPLChatType type = self.data.type;
    
    CGFloat width = self.data.view.frame.size.width;
    CGFloat height = self.data.view.frame.size.height;

    CGFloat x = (type == ChatTypeSomeoneElse) ? 0 : self.frame.size.width - width - self.data.insets.left - self.data.insets.right;
    CGFloat y = 0;
    
    // Adjusting the x coordinate for avatar
    if (self.showAvatar)
    {
        [self.avatarImage removeFromSuperview];
#if !__has_feature(objc_arc)
        self.avatarImage = [[[UIImageView alloc] initWithImage:(self.data.avatar ? self.data.avatar : [UIImage imageNamed:@"missingAvatar.png"])] autorelease];
#else
        self.avatarImage = [[UIImageView alloc] initWithImage:(self.data.avatar ? self.data.avatar : [UIImage imageNamed:@"missingAvatar.png"])];
#endif
        self.avatarImage.layer.cornerRadius = 9.0;
        self.avatarImage.layer.masksToBounds = YES;
        self.avatarImage.layer.borderColor = [UIColor colorWithWhite:0.0 alpha:0.2].CGColor;
        self.avatarImage.layer.borderWidth = 1.0;
        
        CGFloat avatarX = (type == ChatTypeSomeoneElse) ? 2 : self.frame.size.width - 52;
        CGFloat avatarY = self.frame.size.height - 50;
        
        self.avatarImage.frame = CGRectMake(avatarX, avatarY, 50, 50);
        [self addSubview:self.avatarImage];
        
        CGFloat delta = self.frame.size.height - (self.data.insets.top + self.data.insets.bottom + self.data.view.frame.size.height);
        if (delta > 0) y = delta;
        
        if (type == ChatTypeSomeoneElse) x += 54;
        if (type == ChatTypeMine) x -= 54;
    }

    [self.customView removeFromSuperview];
    self.customView = self.data.view;
    self.customView.frame = CGRectMake(x + self.data.insets.left, y + self.data.insets.top, width, height);
    [self.contentView addSubview:self.customView];

    if (self.showBubble) {
        if (type == ChatTypeSomeoneElse)
        {
            self.chatImage.image = [[UIImage imageNamed:@"chatSomeone.png"] stretchableImageWithLeftCapWidth:21 topCapHeight:14];

        }
        else {
            self.chatImage.image = [[UIImage imageNamed:@"chatMine.png"] stretchableImageWithLeftCapWidth:15 topCapHeight:14];
        }

        self.chatImage.frame = CGRectMake(x, y, width + self.data.insets.left + self.data.insets.right, height + self.data.insets.top + self.data.insets.bottom);
    }
}

@end
