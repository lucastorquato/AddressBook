//
//  CreateGroupViewController.m
//  AddressBook
//
//  Created by Lucas Torquato on 15/04/13.
//  Copyright (c) 2013 com.Torquato. All rights reserved.
//

#import "CreateGroupViewController.h"

#import "Group.h"
#import "RootGroupViewController.h"

@interface CreateGroupViewController ()

@end

@implementation CreateGroupViewController

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

- (IBAction)doCreation:(id)sender
{
    Group *newGroup = [[Group alloc] initWithName:self.nameTextField.text];
    
    [self.groupReference addItem:newGroup];
    
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"ReloadDataNotification" object:self];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelCreation:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
