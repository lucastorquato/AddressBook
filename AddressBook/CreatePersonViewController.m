//
//  CreatePersonViewController.m
//  AddressBook
//
//  Created by Lucas Torquato on 15/04/13.
//  Copyright (c) 2013 com.Torquato. All rights reserved.
//

#import "CreatePersonViewController.h"

#import "Group.h"
#import "Person.h"

@interface CreatePersonViewController ()

@end

@implementation CreatePersonViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [self.nameTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)doneCreation:(id)sender
{
    Person *newPerson = [[Person alloc] initWithName:self.nameTextField.text andNumber:self.numberTextField.text];
    
    [self.groupReference addItem:newPerson];
    
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"ReloadDataNotification" object:self];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelCreation:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
