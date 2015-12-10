//
//  PlaySong.m
//  Monzix
//
//  Created by Phuong on 12/7/15.
//  Copyright © 2015 Techmaster. All rights reserved.
//

#import "PlaySong.h"

@interface PlaySong ()

@end

@implementation PlaySong

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back.png"] style:UIBarButtonItemStylePlain target:self action:nil];
    backButton.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = backButton;
    
    UIBarButtonItem *changeTapeButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"tape_btn.png"] style:UIBarButtonItemStylePlain target:self action:nil];
    changeTapeButton.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = changeTapeButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
