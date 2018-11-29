//
//  SwitchView.m
//  MilkTea
//
//  Created by Chen Wang on 8/17/18.
//  Copyright © 2018 Chen Wang. All rights reserved.
//

#import "SwitchView.h"
#import "Masonry.h"
@implementation SwitchView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor lightGrayColor];
    [self addSwitch];
    return self;
}

-(void)addSwitch{
    self.sh = [[UISwitch alloc]init];
    [self addSubview:self.sh];
    
    [self.sh mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(10);
        make.bottom.mas_offset(-10);
    }];
}
@end
