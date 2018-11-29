//
//  ScrollView+PageController.m
//  MilkTea
//
//  Created by Chen Wang on 8/17/18.
//  Copyright © 2018 Chen Wang. All rights reserved.
//

#import "ScrollView+PageController.h"
#define VIEW_WIDTH  self.frame.size.width
#define VIEW_HEIGHT self.frame.size.height
#define BUTTON_HEIGHT 40
#define SCROLL_HEIGHT 240
#define LINKBUTTON_HEIGHT 120

@implementation ScrollView_PageController

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self addScroll:frame];
    [self addPageControl];
    
    return self;
}

-(void)addScroll:(CGRect)frame{
    _scrollView= [[UIScrollView alloc] init];
    _scrollView.frame = frame;
    _scrollView.backgroundColor = [UIColor blackColor];
    _scrollView.delegate = self;
    [self addSubview:_scrollView];
    
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    
    _scrollView.showsHorizontalScrollIndicator = NO; //隐藏横向滚动条
    _scrollView.showsVerticalScrollIndicator = NO; //隐藏竖向滚动条
    
    
    
    UIImageView * viewHead = [[UIImageView alloc] init];
    viewHead.frame =_scrollView.bounds;
    viewHead.backgroundColor = [UIColor blueColor];
    [viewHead setImage:[UIImage imageNamed:@"slide3"]];
    [_scrollView addSubview:viewHead];
    
    UIImageView * view1 = [[UIImageView alloc] init];
    view1.frame = CGRectMake(VIEW_WIDTH, 0, self.frame.size.width,_scrollView.frame.size.height);
    view1.backgroundColor = [UIColor redColor];
    [view1 setImage:[UIImage imageNamed:@"slide1"]];
    [_scrollView addSubview:view1];
    
    UIImageView * view2 = [[UIImageView alloc] init];
    view2.frame = CGRectMake(VIEW_WIDTH * 2, 0, self.frame.size.width,_scrollView.frame.size.height);
    view2.backgroundColor = [UIColor yellowColor];
    [view2 setImage:[UIImage imageNamed:@"slide2"]];
    [_scrollView addSubview:view2];
    
    UIImageView * view3 = [[UIImageView alloc] init];
    view3.frame = CGRectMake(VIEW_WIDTH * 3, 0, self.frame.size.width,_scrollView.frame.size.height);
    view3.backgroundColor = [UIColor blueColor];
    [view3 setImage:[UIImage imageNamed:@"slide3"]];
    [_scrollView addSubview:view3];
    
    UIImageView * viewTail = [[UIImageView alloc] init];
    viewTail.frame = CGRectMake(VIEW_WIDTH * 4, 0, self.frame.size.width,_scrollView.frame.size.height);
    viewTail.backgroundColor = [UIColor redColor];
    [viewTail setImage:[UIImage imageNamed:@"slide1"]];
    [_scrollView addSubview:viewTail];
    
    
    
    _scrollView.contentSize = CGSizeMake(VIEW_WIDTH * 5,_scrollView.frame.size.height);
    [_scrollView setContentOffset:CGPointMake(VIEW_WIDTH, 0)];
}





-(void)addPageControl{
    _pageController = [[UIPageControl alloc] initWithFrame:CGRectMake(VIEW_WIDTH-100,SCROLL_HEIGHT-40,100,40)];
    
    [self addSubview:_pageController];
    
    _pageController.numberOfPages = 3;
    _pageController.currentPage = 0;
    _pageController.currentPageIndicatorTintColor = [UIColor whiteColor];
    
    _pageController.pageIndicatorTintColor = [UIColor grayColor];
    _pageController.hidesForSinglePage = YES;
    _pageController.defersCurrentPageDisplay = YES;
    [_pageController addTarget:self action:@selector(PageTap) forControlEvents:UIControlEventValueChanged];
    
}


-(void)PageTap{
    NSLog(@"Tapp!!");
//    [_scrollView setContentOffset:CGPointMake(VIEW_WIDTH * (_pageController.currentPage),               _scrollView.contentOffset.y) animated:YES]; //设置scrollview的显示为当前滑动到的页面
}



-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    CGPoint offset = scrollView.contentOffset;
    if(scrollView.contentOffset.x == 0){
        _pageController.currentPage = 2;
        NSLog(@"offset = 0");
        [scrollView setContentOffset:CGPointMake(VIEW_WIDTH*3, 0)];
    }
    else if(scrollView.contentOffset.x == VIEW_WIDTH*4){
        _pageController.currentPage = 0;
        NSLog(@"offset = VIEW_WITH*4");
        [scrollView setContentOffset:CGPointMake(VIEW_WIDTH, 0)];
    }else{
        _pageController.currentPage = (offset.x / (VIEW_WIDTH))-1; //计算当前的页码
        [_pageController updateCurrentPageDisplay];
    }
}


@end
