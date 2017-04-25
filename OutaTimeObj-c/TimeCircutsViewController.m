//
//  ViewController.m
//  OutaTimeObj-c
//
//  Created by Shane Nelson on 4/25/17.
//  Copyright © 2017 Shane Nelson. All rights reserved.
//

#import "TimeCircutsViewController.h"
#import "DatePickerViewController.h"

@interface TimeCircutsViewController () <DatePickerDelegate>

{
  NSTimer *timer;
  NSDateFormatter *dateFormatter;
  int currentSpeed;
}

@property (weak, nonatomic) IBOutlet UILabel *presentTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *destinationTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastTimeDepartedLabel;
@property (weak, nonatomic) IBOutlet UILabel *speedLabel;


@end

@implementation TimeCircutsViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  NSString *formatString = [NSDateFormatter dateFormatFromTemplate:@"MMMddyyyy" options:0 locale:[NSLocale currentLocale]];
  dateFormatter = [[NSDateFormatter alloc] init];
  dateFormatter.dateFormat = formatString;
  
  self.presentTimeLabel.text = [dateFormatter stringFromDate:[NSDate date]];
  currentSpeed = 0;
  self.speedLabel.text = [NSString stringWithFormat:@"%d MPH", currentSpeed];
  self.lastTimeDepartedLabel.text = @"--- -- ----";
}

- (void) stopTimer
{
  [timer invalidate];
  timer = nil;
}


- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}
- (IBAction)travelBack:(UIButton *)sender
{
  if (!timer)
  {
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateSpeed) userInfo:nil repeats:YES];
    
  }
}
-(void) updateSpeed
{
  if (currentSpeed < 88)
  {
    currentSpeed++;
    self.speedLabel.text = [NSString stringWithFormat:@"%D MPH", currentSpeed];
  }
  else
  {
    [self stopTimer];
    self.lastTimeDepartedLabel.text = self.presentTimeLabel.text;
    self.presentTimeLabel.text = self.destinationTimeLabel.text;
    self.speedLabel.text = @"0 MPH";
  }
}


- (void)dateWasChosen:(NSDate *)chosenDate
{
  self.destinationTimeLabel.text = [dateFormatter stringFromDate:chosenDate];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  DatePickerViewController *datePickerVC = [segue destinationViewController];
  datePickerVC.delegate = self;
}






@end
