//
//  ViewController.m
//  SHNakamapActivityDemo
//
//  Created by shuichi on 12/12/17.
//  Copyright (c) 2012年 Shuichi Tsutsumi. All rights reserved.
//

#import "ViewController.h"
#import "SHNakamapActivity.h"
#import "NSString+URLEncoding.h"


@interface ViewController ()

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark -------------------------------------------------------------------
#pragma mark IBAction

- (IBAction)pressBtn:(UIButton *)sender {
    
    NSString *text  = [@"タップ忍者がAppStoreのBest of 2012に選ばれました！ http://t.co/iy2Oq78T" URLEncodedString];

    SHNakamapActivity *nakamapActivity = [[SHNakamapActivity alloc] init];
        
    UIActivityViewController *activityView = [[UIActivityViewController alloc] initWithActivityItems:@[text]
                                                                               applicationActivities:@[nakamapActivity]];
    
    [self presentViewController:activityView animated:YES completion:nil];
}

@end
