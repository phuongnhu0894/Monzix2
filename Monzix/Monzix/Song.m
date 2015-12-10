//
//  Song.m
//  Monzix
//
//  Created by Phuong on 12/6/15.
//  Copyright © 2015 Techmaster. All rights reserved.
//

#import "Song.h"

@implementation Song
- (instancetype)initWithTitle:(NSString *)title
                    andArtist:(NSString *)artist
                     andGenre:(NSString *)genre
{
    if (self = [super init]) {
    self = [super init];
    self.title = title;
    self.artist = artist;
    self.genre = genre;
    }
    return self;
}


@end
