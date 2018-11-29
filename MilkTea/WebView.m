//
//  WebView.m
//  MilkTea
//
//  Created by Chen Wang on 8/20/18.
//  Copyright © 2018 Chen Wang. All rights reserved.
//

#import "WebView.h"

@interface WebView ()

@end

@implementation WebView

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)loadRequest{
    UIWebView* wv = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:wv];
    NSURLRequest* request = [NSURLRequest requestWithURL:self.URL];
    [wv loadRequest:request];
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
