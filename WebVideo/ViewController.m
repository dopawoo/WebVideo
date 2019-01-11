//
//  ViewController.m
//  WebVideo
//
//  Created by dopa on 2019/1/10.
//  Copyright © 2019 dota. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
#import "ZQVideoPlayController.h"

@interface ViewController ()<WKNavigationDelegate, WKUIDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:webView];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://101.200.43.144/"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [webView loadRequest:request];
    webView.navigationDelegate = self;
    webView.UIDelegate = self;
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    
    return;
    
    self.navigationItem.rightBarButtonItem = nil;
    NSString *url = [NSString stringWithFormat:@"%@", navigationAction.request.URL];
    
    url = [url stringByReplacingOccurrencesOfString:@"winapi://?" withString:@""];
    
    NSData *nsdataFromBase64String = [[NSData alloc]
                                      initWithBase64EncodedString:url options:0];
    NSString *base64Decoded = [[NSString alloc]
                               initWithData:nsdataFromBase64String encoding:NSUTF8StringEncoding];
    NSLog(@"Decoded: %@", base64Decoded);
    
    NSData *jsonData = [url dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    
    ZQVideoPlayController *listTableVC = [[ZQVideoPlayController alloc] init];
    listTableVC.videoUrl = @"http://220.170.49.117/11/l/e/i/k/leikjvlvwbwpygisbsvdydrdkmogiq/he.yinyuetai.com/68920165E6BF45DF64C718A7BA4DC20F.mp4?sc=d0b97c64b73f6012&br=3130&vid=3292052&aid=33018&area=KR&vst=0&ptp=mv&rd=yinyuetai.com";
    [self.navigationController pushViewController:listTableVC animated:YES];
    
    NSLog(@"url - %@", url);
    decisionHandler(WKNavigationActionPolicyAllow);
    
}


@end
