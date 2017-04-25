//
//  DatePickerViewController.h
//  OutaTimeObj-c
//
//  Created by Shane Nelson on 4/25/17.
//  Copyright © 2017 Shane Nelson. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DatePickerDelegate

- (void)dateWasChosen:(NSDate *)chosenDate;


@end

@interface DatePickerViewController : UIViewController

@property (nonatomic) id<DatePickerDelegate> delegate;

@end
