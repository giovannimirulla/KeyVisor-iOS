//
//  ViewController.h
//  KeyVisor
//
//  Created by Giovanni Mirulla on 07/05/16.
//  Copyright © 2016 Giovanni Mirulla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tcpSocketChat.h"
@interface ViewController : UIViewController <tcpSocketChatDelegate , UITextFieldDelegate>

@property (nonatomic,strong) tcpSocketChat* socket;
@property (weak, nonatomic) IBOutlet UITextView *logView;
@property (weak, nonatomic) IBOutlet UITextField *ipField;
@property (weak, nonatomic) IBOutlet UITextField *messageField;

- (IBAction)connect:(id)sender;
- (IBAction)send:(id)sender;
-(void)receivedMessage:(NSString *)data;

@end

