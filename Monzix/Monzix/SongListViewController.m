//
//  SongListViewController.m
//  Monzix
//
//  Created by Phuong on 12/14/15.
//  Copyright © 2015 Techmaster. All rights reserved.
//

#import "SongListViewController.h"
#import "Song.h"
#import "TMAPIClient.h"
#import "PlaySongViewController.h"
#import "Playlist.h"
#import <SDWebImage/UIImageView+WebCache.h>


@interface SongListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *songList;

@end

@implementation SongListViewController
{
    NSString *url;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Audios on Tumblr";
    [self loadSongs];
}

- (void)loadSongs {
    
    // Authenticate via API Key
    [TMAPIClient sharedInstance].OAuthConsumerKey = @"c0vOybTgR2bB44bDRXrofJbKs85h4JeBlO3BLvvbQ5QZIkWOKA";
    
    // Make the request
    [[TMAPIClient sharedInstance] tagged:@"audio"
                              parameters:nil
                                callback:^ (id result, NSError *error)
     {
         self.songList = [NSMutableArray new];
         NSArray *data = (NSArray *)result;
         for (NSDictionary *object in data) {
             if ([((NSString *)object[@"type"]) isEqualToString:@"audio"]) {
                 Song *song = [Song new];
                 song.title = (NSString *)object[@"track_name"];
                 song.artist = (NSString *)object[@"artist"];
                 song.coverArtUrl = (NSString *)object[@"album_art"];
                 song.album = (NSString *)object[@"album"];
                 song.url = (NSString *)object[@"audio_url"];
                 url = song.url;
                 if ([((NSString *) object[@"audio_type"]) isEqualToString:@"tumblr"]) {
                     NSString *fileName = [song.url lastPathComponent];
                     song.url = [NSString stringWithFormat:@"http://a.tumblr.com/%@o1.mp3", fileName];
                 }
                 [self.songList addObject:song];
             }
         }
         [self.tableView reloadData];
    }];
    
}

- (void)play:(Song *)song {
    PlaySongViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"playController"];
    controller.songToPlay = song;
    controller.url = url;
    
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)addToPlaylist:(Song *)song {
    
}

#pragma mark - UITableViewDatasource & Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.songList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"songCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    Song *currentSong = self.songList[indexPath.row];
    
    UILabel *titleLabel = (UILabel *)[cell viewWithTag:100];
    titleLabel.text = currentSong.title;
    
    UILabel *artistLabel = (UILabel *)[cell viewWithTag:101];
    artistLabel.text = currentSong.artist;
    
    UIImageView *coverImageView = (UIImageView *)[cell viewWithTag:102];
    if (currentSong.coverArtUrl) {
        [coverImageView sd_setImageWithURL:[NSURL URLWithString:currentSong.coverArtUrl]
                          placeholderImage:[UIImage new]];
    } else {
        [coverImageView setImage:[UIImage new]];
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    Song *currentSong = self.songList[indexPath.row];
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@""
                                          message:@"What do you want to do with this song?"
                                          preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * _Nonnull action)
    {
        NSLog(@"Cancel");
    }];
    
    UIAlertAction *playAction = [UIAlertAction actionWithTitle:@"Play Song"
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * _Nonnull action)
    {
        [self play:currentSong];
    }];
    UIAlertAction *addToPlayListAction = [UIAlertAction actionWithTitle:@"Add To Playlist"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * _Nonnull action)
    {
        [self addToPlaylist:currentSong];
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:playAction];
    [alertController addAction:addToPlayListAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
