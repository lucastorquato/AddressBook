//
//  GroupViewController.m
//  AddressBook
//
//  Created by Lucas Torquato on 15/04/13.
//  Copyright (c) 2013 com.Torquato. All rights reserved.
//

#import "GroupViewController.h"

#import "Group.h"
#import "Person.h"
#import "CreatePersonViewController.h"

@interface GroupViewController ()

@end

@implementation GroupViewController

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
    
    self.title = [NSString stringWithFormat:@"%@ Group",self.group.name];

    if (!self.group.abItens) {
        self.group.abItens = [[NSMutableArray alloc] init];
    }
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
    return self.group.abItens.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell; //= [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    Person *person = [self.group.abItens objectAtIndex:indexPath.row];
    
    cell.textLabel.text = person.name;
    cell.detailTextLabel.text = person.number;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"CreatePerson"]) {
        
        CreatePersonViewController *createPersonViewController = [segue destinationViewController];
        createPersonViewController.groupReference = self.group;
        
    }
}

@end
