//
//  ViewController.m
//  Monzix
//
//  Created by student on 11/30/15.
//  Copyright © 2015 Techmaster. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *menuTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //initwithcustomview
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"search.png"] style:UIBarButtonItemStylePlain target:self action:nil];
    searchButton.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = searchButton;
    
    UIBarButtonItem *soundcloudButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"soundcloud.png"] style:UIBarButtonItemStylePlain target:self action:nil];
    soundcloudButton.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = soundcloudButton;
    
    self.navigationItem.title = @"CHOOSE PLAYLIST";
  
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"MenuCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    UILabel *label = [cell viewWithTag:100];
    label.text = [NSString stringWithFormat:@"Row %li", indexPath.row];

    return cell;}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
