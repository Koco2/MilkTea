//
//  UIView1.h
//  MilkTea
//
//  Created by Chen Wang on 8/16/18.
//  Copyright © 2018 Chen Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LinkButton.h"


@interface UIView1 : UIView <UIScrollViewDelegate>
@property(nonatomic,strong) LinkButton *b1;
@property(nonatomic,strong) LinkButton *b2;

-(instancetype)initWithFrame:(CGRect)frame;

@end
