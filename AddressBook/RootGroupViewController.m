//
//  RootGroupViewController.m
//  AddressBook
//
//  Created by Lucas Torquato on 15/04/13.
//  Copyright (c) 2013 com.Torquato. All rights reserved.
//

#import "RootGroupViewController.h"

#import "Group.h"
#import "CreateGroupViewController.h"
#import "CreatePersonViewController.h"
#import "GroupViewController.h"

@interface RootGroupViewController ()

@end

@implementation RootGroupViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    if (!self.group) {
        self.group = [[Group alloc] initWithName:@"Root Group"];
    }
    
    self.title = self.group.name;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveReloadDataNotification:)
                                                 name:@"ReloadDataNotification"
                                               object:nil];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell;
    
    id<ItemProtocol> item = [self.group.items objectAtIndex:indexPath.row];
    
    if ([item isKindOfClass:[Group class]]) {
    
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        cell.textLabel.text = item.name;
        [cell.imageView setImage:[UIImage imageNamed:@"normal_folder.png"]];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    }else{
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    
        cell.textLabel.text = item.name;
        cell.detailTextLabel.text = item.number;
        [cell.imageView setImage:[UIImage imageNamed:@"folder_contact.png"]];
    }

    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<ItemProtocol> item = [self.group.items objectAtIndex:indexPath.row];

    if ([item isKindOfClass:[Group class]]) {
    
        RootGroupViewController *rootGroupViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"RootGroupViewController"];
        rootGroupViewController.group = item;
        
        [self.navigationController pushViewController:rootGroupViewController animated:YES];
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        id<ItemProtocol> item = [self.group.items objectAtIndex:indexPath.row];
        [self.group removeItem:item];
        
        //[self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Create New Group

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"CreateGroup"]){
        
        CreateGroupViewController *createGroupViewController = [segue destinationViewController];
        createGroupViewController.groupReference = self.group;
        
    }else if([segue.identifier isEqualToString:@"CreatePerson"]){
    
        CreatePersonViewController *createPersonViewController = [segue destinationViewController];
        createPersonViewController.groupReference = self.group;
    }
}

#pragma mark - Observer

- (void)receiveReloadDataNotification:(NSNotification *) notification
{
    if ([[notification name] isEqualToString:@"ReloadDataNotification"]){
        [self.tableView reloadData];
    }
}

@end
