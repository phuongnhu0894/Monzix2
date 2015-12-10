//
//  DataManager.m
//  Monzix
//
//  Created by Phuong on 12/7/15.
//  Copyright © 2015 Techmaster. All rights reserved.
//

#import "DataManager.h"
#import "Song.h"

@implementation DataManager
+ (instancetype) getSingleton {
    
    static DataManager* dataManager = nil;
    static dispatch_once_t dispatchOnce;
    dispatch_once(&dispatchOnce,^ {
        dataManager = [self new];
        NSString* filePath = [[NSBundle mainBundle] pathForResource:@"Song" ofType:@"plist"];
        NSArray* raw = [NSArray arrayWithContentsOfFile:filePath];
        NSMutableArray* temp = [[NSMutableArray alloc] initWithCapacity:raw.count];
        for (NSDictionary* item in raw) {
            Song* song = [[Song alloc] initWithTitle:[item valueForKey:@"title"]
                                           andArtist:[item valueForKey:@"artist"]
                                            andGenre:[item valueForKey:@"genre"]];
            [temp addObject:song];
        }
        
    });
    return dataManager;
}
@end
