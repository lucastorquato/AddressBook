//
//  ABItem.h
//  AddressBook
//
//  Created by Lucas Torquato on 15/04/13.
//  Copyright (c) 2013 com.Torquato. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol ItemProtocol <NSObject>

@required
@property (nonatomic, strong) NSString *name;

@optional
@property (nonatomic, strong) NSString *number;
- (void)addItem:(id<ItemProtocol>)item;
- (void)removeItem:(id<ItemProtocol>)item;

@end
