//
//  PlaySong.h
//  Monzix
//
//  Created by Phuong on 12/7/15.
//  Copyright © 2015 Techmaster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Song.h"

@interface PlaySongViewController : UIViewController

@property (strong, nonatomic) Song *songToPlay;
@property (strong, nonatomic) NSString *url;

@end
