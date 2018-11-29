//
//  UIView3.m
//  MilkTea
//
//  Created by Chen Wang on 8/16/18.
//  Copyright © 2018 Chen Wang. All rights reserved.
//

#import "UIView3.h"
#import "Masonry.h"

@implementation UIView3

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor whiteColor];
    UILabel* title = [[UILabel alloc] init];
    title.text = @"Page 3";
    [self addSubview:title];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(100, 40));
    }];
    return self;
}


@end
