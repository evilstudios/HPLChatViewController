//
//  HPLChatData.h
//
//  Created by Alex Barinov
//
//  This work is licensed under the Creative Commons Attribution-ShareAlike 3.0 Unported License.
//  To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/
//

#import <Foundation/Foundation.h>

typedef enum _HPLChatType
{
    ChatTypeMine = 0,
    ChatTypeSomeoneElse = 1
} HPLChatType;

@interface HPLChatData : NSObject

@property (readonly, nonatomic, strong) NSDate *date;
@property (readonly, nonatomic) HPLChatType type;
@property (readonly, nonatomic, strong) UIView *view;
@property (readonly, nonatomic) UIEdgeInsets insets;
@property (nonatomic, strong) UIImage *avatar;

- (id)initWithText:(NSString *)text date:(NSDate *)date type:(HPLChatType)type;
+ (id)dataWithText:(NSString *)text date:(NSDate *)date type:(HPLChatType)type;
- (id)initWithImage:(UIImage *)image date:(NSDate *)date type:(HPLChatType)type;
+ (id)dataWithImage:(UIImage *)image date:(NSDate *)date type:(HPLChatType)type;
- (id)initWithView:(UIView *)view date:(NSDate *)date type:(HPLChatType)type insets:(UIEdgeInsets)insets;
+ (id)dataWithView:(UIView *)view date:(NSDate *)date type:(HPLChatType)type insets:(UIEdgeInsets)insets;

@end
