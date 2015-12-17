//
//  Song.h
//  Monzix
//
//  Created by Phuong on 12/6/15.
//  Copyright © 2015 Techmaster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Song : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *artist;
@property (strong, nonatomic) NSString *album;
@property (nonatomic, strong) NSString *genre;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *coverArtUrl;

- (id)initWithTitle:(NSString *)title andArtist:(NSString *)artist andGenre:(NSString *)genre;

@end
