//
//  CreatePersonViewController.h
//  AddressBook
//
//  Created by Lucas Torquato on 15/04/13.
//  Copyright (c) 2013 com.Torquato. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Group;

@interface CreatePersonViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *numberTextField;
@property (nonatomic, strong) Group *groupReference;

- (IBAction)doneCreation:(id)sender;
- (IBAction)cancelCreation:(id)sender;

@end
