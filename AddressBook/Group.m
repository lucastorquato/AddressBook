//
//  Group.m
//  AddressBook
//
//  Created by Lucas Torquato on 15/04/13.
//  Copyright (c) 2013 com.Torquato. All rights reserved.
//

#import "Group.h"

@implementation Group

- (id)initWithName:(NSString*)name
{
    self = [super init];
    if (self) {
        self.name = name;
        self.items = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addItem:(id<ItemProtocol>)item
{
    [self.items addObject:item];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ReloadDataNotification" object:self];
}

- (void)removeItem:(id<ItemProtocol>)item
{
    [self.items removeObject:item];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ReloadDataNotification" object:self];
}

@end
