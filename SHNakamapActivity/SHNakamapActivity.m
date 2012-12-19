//
//  SHNakamapActivity.m
//  SHNakamapActivityDemo
//
//  Created by shuichi on 12/12/17.
//  Copyright (c) 2012年 Shuichi Tsutsumi. All rights reserved.
//

#import "SHNakamapActivity.h"


#define kAppStoreURL @"https://itunes.apple.com/jp/app/id405548206?mt=8"


@implementation SHNakamapActivity


#pragma mark -------------------------------------------------------------------
#pragma mark override

- (NSString *)activityType {
    
    return @"com.kayac.nakamap";
}


- (UIImage *)activityImage {
    
    return [UIImage imageNamed:@"NakamapActivityIcon.png"];
}


- (NSString *)activityTitle {
    
    return @"Nakamap";
}


- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems {
    
    for (id activityItem in activityItems) {
        
        if ([activityItem isKindOfClass:[NSString class]]) {
            
            return YES;
        }
    }
    
    return NO;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems {
    
    for (id activityItem in activityItems) {
    
        if ([self openNakamapWithItem:activityItem]) {
        
            break;
        }
    }
}


#pragma mark -------------------------------------------------------------------
#pragma mark Private


- (BOOL)openNakamapWithItem:(id)item {

    NSURL *url = [NSURL URLWithString:@"nakamap://chat"];
    BOOL isUsableNakamap = [[UIApplication sharedApplication] canOpenURL:url];
    
    if (!isUsableNakamap) {
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:kAppStoreURL]];
        
        return NO;
    }
    
    NSString *urlStrWithItem = nil;
    
    if ([item isKindOfClass:[NSString class]]) {
        
        urlStrWithItem = [NSString stringWithFormat:@"nakamap://chat?message=%@", item];
    }
//    else if ([item isKindOfClass:[UIImage class]]) {
//        
//        UIPasteboard *pasteboard = [UIPasteboard pasteboardWithUniqueName];
//        
//        [pasteboard setData:UIImagePNGRepresentation(item) forPasteboardType:@"public.png"];
//        
//        NakamapURLString = [NSString stringWithFormat:@"nakamap://msg/image/%@", pasteboard.name];
//    }
    else {
        
        return NO;
    }
    
    NSURL *urlWithItem = [NSURL URLWithString:urlStrWithItem];
    
    [[UIApplication sharedApplication] openURL:urlWithItem];
    
    return YES;
}

@end
