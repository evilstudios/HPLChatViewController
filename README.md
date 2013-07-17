HPLChatViewController
=====================

HPLChatViewController is a component for making sms like screens on iOS. It is a fork of https://github.com/AlexBarinov/UIBubbleTableView, which is no longer maintained.


## Installation

### Cocoapods

```ruby
pod 'HPLChatViewController', '~> 0.0.3'
```

## Usage

You must implement a view controller that conforms to the `HPLChatTableViewDataSource` protocol. This requires implementing the following
methods:

``` objective-c
- (NSInteger) numberOfRowsForChatTable:(HPLChatTableView *)tableView;
- (HPLChatData *)chatTableView:(HPLChatTableView *)tableView dataForRow:(NSInteger)row;
```

## Customization

The following properties are exposed on `HPLChatData` to allow for visual customization.

```objective-c
/**
 Set a custom avatar view. If nil then the default Not-Found image is used for avatar.
 */
@property (readwrite, nonatomic, strong) UIView *avatarView;

/**
 Set a custom bubble view if you don't want to use the default bubble view style.
 If nil, default style used.
 */
@property (readwrite, nonatomic, strong) UIView *bubbleView;


/**
 Set a status for a message with a custom view to be displayed
 */
- (void)setMessageStatus:(HPLChatMessageStatus)messageStatus withView:(UIView*)statusView;

```


## Contributors

The project was created by [Alex Barinov](https://github.com/AlexBarinov/), maintained by

* [Matthew Conlen](http://www.github.com/mathisonian) mc@mathisonian.com
* [Danny Ricciotti](http://www.github.com/objectiveSee) [@topwobble on twitter](http://www.twitter.com/topwobble)
* [Eli Burke](https://github.com/eliburke)

## License

This work is licensed under the Creative Commons Attribution-ShareAlike 3.0 Unported License. To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/. 
See [LICENSE](LICENSE) for the complete license.

<a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/deed.en_US"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/3.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/deed.en_US">Creative Commons Attribution-ShareAlike 3.0 Unported License</a>.
