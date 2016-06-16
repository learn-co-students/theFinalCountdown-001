//
//  FISViewController.h
//  theFinalCountdown
//
//  Created by Joe Burgess on 7/9/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FISViewController : UIViewController

- (IBAction)startButton:(id)sender;
- (IBAction)pauseButton:(id)sender;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UILabel *clockLabel;
@property (nonatomic) NSTimer *timer;

-(void)tick:(NSTimer *)theTimer;

@end
