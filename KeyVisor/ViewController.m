//
//  ViewController.m
//  KeyVisor
//
//  Created by Giovanni Mirulla on 07/05/16.
//  Copyright © 2016 Giovanni Mirulla. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - tcpSocketDelegate
-(void)receivedMessage:(NSString *)data
{
    NSArray *myArray = [data componentsSeparatedByString:@"-"];
    NSMutableArray *array = [NSMutableArray arrayWithArray:myArray];
    [array removeLastObject];
    if ([[array objectAtIndex:0] isEqualToString:@"Keys"]) {
        [array objectAtIndex:1];
    }
    
    
    NSLog(@"Messaggio:%@",array);
    self.logView.text = data;
    [self.logView scrollRangeToVisible:NSMakeRange([self.logView.text length], 0)];
}
- (IBAction)connect:(id)sender {
    self.socket = [[tcpSocketChat alloc] initWithDelegate:self AndSocketHost:self.ipField.text AndPort:5669];
    [self.socket sendMessage:@"Test Mode"];
}
-(IBAction)send:(id)sender{
[self.socket sendMessage:self.messageField.text];
self.messageField.text = @"";
}

@end
