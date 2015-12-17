//
//  Playlist.h
//  Monzix
//
//  Created by Phuong on 12/14/15.
//  Copyright © 2015 Techmaster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Playlist : NSObject

@property (strong, nonatomic) NSArray *songs;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *genre;

@end
