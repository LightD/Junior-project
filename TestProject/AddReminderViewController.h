//
//  AddReminderViewController.h
//  TestProject
//
//  Created by User on 1/12/13.
//  Copyright (c) 2013 Light. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BSKeyboardControls.h"

@interface AddReminderViewController : UIViewController  <UITextFieldDelegate, UITextViewDelegate, BSKeyboardControlsDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtTitle;

@property (weak, nonatomic) IBOutlet UITextView *txtDescription;

@end
