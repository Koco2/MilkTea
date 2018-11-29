//
//  ScrollView+PageController.h
//  MilkTea
//
//  Created by Chen Wang on 8/17/18.
//  Copyright © 2018 Chen Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollView_PageController : UIView<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView* scrollView;
@property(nonatomic,strong)UIPageControl* pageController;

-(instancetype)initWithFrame:(CGRect)frame;

@end
