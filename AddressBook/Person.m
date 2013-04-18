//
//  Person.m
//  AddressBook
//
//  Created by Lucas Torquato on 15/04/13.
//  Copyright (c) 2013 com.Torquato. All rights reserved.
//

#import "Person.h"

@implementation Person

- (id)initWithName:(NSString*)name andNumber:(NSString*)number
{
    self = [super init];
    if (self) {
        self.name = name;
        self.number = number;
    }
    return self;
}

@end
