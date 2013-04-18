//
//  Person.h
//  AddressBook
//
//  Created by Lucas Torquato on 15/04/13.
//  Copyright (c) 2013 com.Torquato. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ABItem.h"

@interface Person : NSObject <ItemProtocol>

@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *number;

- (id)initWithName:(NSString*)name andNumber:(NSString*)number;

@end
