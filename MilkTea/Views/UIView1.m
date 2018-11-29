//
//  UIView1.m
//  MilkTea
//
//  Created by Chen Wang on 8/16/18.
//  Copyright © 2018 Chen Wang. All rights reserved.
//

#import "UIView1.h"
#import "Masonry.h"
#import "LinkButton.h"
#import "ScrollView+PageController.h"
#import "webView.h"


#define VIEW_WIDTH  self.frame.size.width
#define VIEW_HEIGHT self.frame.size.height
#define BUTTON_HEIGHT 40
#define SCROLL_HEIGHT 240
#define LINKBUTTON_HEIGHT 120

@implementation UIView1

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor whiteColor];
    [self addLinkButtons];
    
    ScrollView_PageController* sp = [[ScrollView_PageController alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, SCROLL_HEIGHT)];
    [self addSubview:sp];

    
    return self;
}


-(void)addLinkButtons{
    self.b1 = [[LinkButton alloc] initWithFrame:CGRectMake(0, SCROLL_HEIGHT, VIEW_WIDTH, LINKBUTTON_HEIGHT)];
    self.b2 = [[LinkButton alloc] initWithFrame:CGRectMake(0, SCROLL_HEIGHT+LINKBUTTON_HEIGHT, VIEW_WIDTH, LINKBUTTON_HEIGHT)];

    [self.b1 addImage:[UIImage imageNamed:@"link1"] Title:@"醇香经典珍珠奶茶" Link:[NSURL URLWithString:@"https://www.baidu.com"]];
    
    [self.b2 addImage:[UIImage imageNamed:@"link2"] Title:@"缤纷百香果茶" Link:[NSURL URLWithString:@"http://www.iqiyi.com/v_19rqy4ncnk.html#curid=1228352700_ad0ecec128495acb6c8b9f3fa9effc94"]];
    
    [self addSubview:self.b1];
    [self addSubview:self.b2];
}


@end
