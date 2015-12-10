//
//  DataManager.h
//  Monzix
//
//  Created by Phuong on 12/7/15.
//  Copyright © 2015 Techmaster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject
@property (nonatomic, strong) NSArray* data;
//class method
+ (instancetype)getSingleton;
@end
