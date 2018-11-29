//
//  LinkButton.m
//  MilkTea
//
//  Created by Chen Wang on 8/16/18.
//  Copyright © 2018 Chen Wang. All rights reserved.
//

#import "LinkButton.h"
#import "Masonry.h"
#define BUTTON_WIDTH  self.frame.size.width
#define BUTTON_HEIGHT 40
#define SCROLL_HEIGHT 240
#define LINKBUTTON_HEIGHT 120

@implementation LinkButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    //self.backgroundColor = [UIColor whiteColor];
    return self;
}

-(void)addImage:(UIImage*)image Title:(NSString*)title Link:(NSURL*)link{
    UIImageView * imageView = [[UIImageView alloc] init];
    UILabel * description = [[UILabel alloc] init];
    
    description.lineBreakMode = NSLineBreakByWordWrapping;
    description.textAlignment = NSTextAlignmentLeft;
    description.numberOfLines = 0;
    description.font = [UIFont systemFontOfSize:17];
    
    imageView.image = image;
    description.text = title;
    
    self.URL = link;
    
    [self addSubview:imageView];
    [self addSubview:description];
    
    
    
    //Masonry Layout
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(10);
        make.bottom.mas_equalTo(-10);
        
        make.width.mas_equalTo(100);
    }];
    [description mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.bottom.mas_equalTo(-10);
        make.left.mas_equalTo(imageView.mas_right).mas_offset(10);
        make.width.mas_equalTo(BUTTON_WIDTH-10-100-10-10);
    }];
}




@end

