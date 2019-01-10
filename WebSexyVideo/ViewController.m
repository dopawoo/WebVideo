//
//  ViewController.m
//  WebSexyVideo
//
//  Created by dopa on 2019/1/10.
//  Copyright © 2019 dota. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:webView];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://101.200.43.144/"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [webView loadRequest:request];
}

@end
