//
//  PlaySong.m
//  Monzix
//
//  Created by Phuong on 12/7/15.
//  Copyright © 2015 Techmaster. All rights reserved.
//

#import "PlaySongViewController.h"
#import "AZSoundItem.h"
#import "AZSoundManager.h"
@import AVFoundation;

@interface PlaySongViewController ()
@property (weak, nonatomic) IBOutlet UIButton *buttonVolUp;
@property (weak, nonatomic) IBOutlet UIButton *buttonVolDown;
@property (weak, nonatomic) IBOutlet UIButton *buttonPlayPause;
@property (weak, nonatomic) IBOutlet UIButton *buttonSuffle;
@property (weak, nonatomic) IBOutlet UIButton *buttonRepeat;
@property (nonatomic, strong) AVAudioPlayer *player;

@end

@implementation PlaySongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ;

    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back.png"] style:UIBarButtonItemStylePlain target:self action:nil];
    backButton.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = backButton;
    
    UIBarButtonItem *changeTapeButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"tape_btn.png"] style:UIBarButtonItemStylePlain target:self action:nil];
    changeTapeButton.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = changeTapeButton;
    

   
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
