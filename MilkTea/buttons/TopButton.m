//
//  TopButton.m
//  MilkTea
//
//  Created by Chen Wang on 8/16/18.
//  Copyright © 2018 Chen Wang. All rights reserved.
//

#import "TopButton.h"
#import "Masonry.h"

@implementation TopButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    //[self setBackgroundColor:[UIColor blueColor]];
//    [self setBackgroundImage:[UIImage imageNamed:@"cart"] forState:normal];
//    [self setBackgroundImage:[UIImage imageNamed:@"cart_highlighted"] forState:UIControlStateSelected];
    
    self.imView = [[UIImageView alloc] init];
    [self addSubview:self.imView];
    self.jsb = [[JSBadgeView alloc]initWithParentView:self alignment:JSBadgeViewAlignmentTopRight];
    [self.jsb setBadgePositionAdjustment:CGPointMake(-15, 10)];
    [self addSubview:self.jsb];
    
    [self.imView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(2);
        make.left.mas_equalTo(25);
        make.right.mas_equalTo(-25);
        make.bottom.mas_equalTo(-2);
    }];
    
    
    return self;
}


-(void)addImage:(NSString*)image Highlight:(NSString*)highlight{
    self.normal = [UIImage imageNamed:image];
    self.imView.image = self.normal;
    self.highlight = [UIImage imageNamed:highlight];
}


@end
