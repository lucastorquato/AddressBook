//
//  CreateGroupViewController.h
//  AddressBook
//
//  Created by Lucas Torquato on 15/04/13.
//  Copyright (c) 2013 com.Torquato. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Group;

@interface CreateGroupViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *idTextField;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;

@property (nonatomic, strong) Group *groupReference;

- (IBAction)doCreation:(id)sender;
- (IBAction)cancelCreation:(id)sender;

@end
