//
//  WebView.h
//  MilkTea
//
//  Created by Chen Wang on 8/20/18.
//  Copyright © 2018 Chen Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebView : UIViewController
@property(nonatomic,strong)NSURL * URL;
-(void)loadRequest;
@end
