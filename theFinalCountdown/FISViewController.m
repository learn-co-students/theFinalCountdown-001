//
//  FISViewController.m
//  theFinalCountdown
//
//  Created by Joe Burgess on 7/9/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"

@interface FISViewController ()

@end

@implementation FISViewController

int hours, minutes, seconds;
int secondsLeft;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.clockLabel setHidden:YES];

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{


}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startButton:(id)sender {
    if (self.timer) {
        [self.datePicker setHidden:NO];
        self.clockLabel.text = @"00:00:00";
        [self.clockLabel setHidden:YES];
        UIButton *button = sender;
        [button setTitle:@"Start" forState:UIControlStateNormal];
        [self.timer invalidate];
        self.timer = nil;
        secondsLeft = 0;
        [self.pauseButton setEnabled:NO];
    } else {
        NSTimeInterval countDownDuration = self.datePicker.countDownDuration;
        secondsLeft = countDownDuration;
        [self.datePicker setHidden:YES];
        [self.clockLabel setHidden:NO];
        UIButton *button = sender;
        [button setTitle:@"Cancel" forState:UIControlStateNormal];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick:) userInfo:nil repeats:YES];
        [self.pauseButton setEnabled:YES];
    }
}

- (IBAction)pauseButton:(id)sender {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
        UIButton *button = sender;
        [button setTitle:@"Resume" forState:UIControlStateNormal];
    } else {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick:) userInfo:nil repeats:YES];
        UIButton *button = sender;
        [button setTitle:@"Pause" forState:UIControlStateNormal];
    }
}

-(void)tick:(NSTimer *)theTimer {
    if (secondsLeft > 0) {
        secondsLeft -- ;
        hours = secondsLeft / 3600;
        minutes = (secondsLeft % 3600) / 60;
        seconds = (secondsLeft %3600) % 60;
        NSString *timeLeft = [NSString stringWithFormat:@"%02d:%02d:%02d", hours, minutes, seconds];
        self.clockLabel.text = timeLeft;
    } else {
        self.clockLabel.text = @"00:00:00";
    }
}

@end
