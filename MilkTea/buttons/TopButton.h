//
//  TopButton.h
//  MilkTea
//
//  Created by Chen Wang on 8/16/18.
//  Copyright © 2018 Chen Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSBadgeView.h"

@interface TopButton : UIButton
@property(nonatomic,strong)JSBadgeView* jsb;

@property(nonatomic,strong)UIImage* normal;
@property(nonatomic,strong)UIImage* highlight;
@property(nonatomic,strong)UIImageView* imView;


-(void)addImage:(NSString*)image Highlight:(NSString*)highlight;
-(instancetype)initWithFrame:(CGRect)frame;
@end
