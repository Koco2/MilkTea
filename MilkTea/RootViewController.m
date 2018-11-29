//
//  RootViewController.m
//  MilkTea
//
//  Created by Chen Wang on 8/16/18.
//  Copyright © 2018 Chen Wang. All rights reserved.
//

#import "RootViewController.h"
#import "Masonry.h"
#import "UIView1.h"
#import "UIView2.h"
#import "UIView3.h"
#import "UIView4.h"
#import "TopButton.h"
#import "SwitchView.h"
#import "LinkButton.h"
#import "WebView.h"


#define SCREEN_WIDTH  self.view.frame.size.width
#define SCREEN_HEIGHT self.view.frame.size.height
#define BUTTON_HEIGHT 40
#define SCROLL_HEIGHT 240
#define LINKBUTTON_HEIGHT 120
#define SWITCH_HEIGHT 40
#define NAVI_HEIGHT self.navigationController.navigationBar.frame.size.height
@interface RootViewController ()<UIScrollViewDelegate>
{
    UIScrollView * mainScrollView;
    UISwitch * sh;
    UIView1 * pageView1;
    UIView2 * pageView2;
    UIView3 * pageView3;
    UIView4 * pageView4;
    NSMutableArray* TopButtons;
    SwitchView* switchView;
}

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self editNavigation];
    [self addTopButtons];
    [self editMainScrollView];
    [self editLinkButtons];
    [self addSwitch];
}

-(void)addSwitch{
    switchView = [[SwitchView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-BUTTON_HEIGHT-NAVI_HEIGHT-SWITCH_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-BUTTON_HEIGHT-NAVI_HEIGHT-SCROLL_HEIGHT-LINKBUTTON_HEIGHT-LINKBUTTON_HEIGHT)];
    [self.view addSubview:switchView];
    [switchView.sh addTarget:self action:@selector(switchClicked) forControlEvents:UIControlEventValueChanged];
}

-(void)switchClicked{
    if(switchView.sh.isOn == YES){
        pageView1.backgroundColor =  [UIColor darkGrayColor];
        pageView2.backgroundColor = [UIColor darkGrayColor];
        pageView3.backgroundColor = [UIColor darkGrayColor];
        pageView4.backgroundColor = [UIColor darkGrayColor];
    }else{
        pageView1.backgroundColor = [UIColor whiteColor];
        pageView2.backgroundColor = [UIColor whiteColor];
        pageView3.backgroundColor = [UIColor whiteColor];
        pageView4.backgroundColor = [UIColor whiteColor];
    }
}



-(void)editNavigation{
    self.view.backgroundColor = [UIColor darkGrayColor];
    //self.navigationItem.title = @"title";
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navig"] forBarMetrics:(UIBarMetricsDefault)];
    [self.navigationController.navigationBar setTranslucent:NO];
}

-(void)addTopButtons{
    TopButton* b1 = [[TopButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/4, BUTTON_HEIGHT)];
    TopButton* b2 = [[TopButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/4, 0, SCREEN_WIDTH/4, BUTTON_HEIGHT)];
    TopButton* b3 = [[TopButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2, 0, SCREEN_WIDTH/4, BUTTON_HEIGHT)];
    TopButton* b4 = [[TopButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2+SCREEN_WIDTH/4, 0, SCREEN_WIDTH/4, BUTTON_HEIGHT)];
    
    [b1 addImage:@"store" Highlight:@"store_highlighted"];
    b1.imView.image = b1.highlight;
    [b2 addImage:@"transport" Highlight:@"transport_highlighted"];
    [b3 addImage:@"question" Highlight:@"question_highlighted"];
    [b4 addImage:@"cart" Highlight:@"cart_highlighted"];
    
    b1.jsb.badgeText = [NSString stringWithFormat:@""];
    b2.jsb.badgeText = [NSString stringWithFormat:@"10"];
    b3.jsb.badgeText = [NSString stringWithFormat:@"1"];
    b4.jsb.badgeText = [NSString stringWithFormat:@"3"];
    
    [b1 setSelected:YES];
    
    [b1 setTag:100001];
    [b2 setTag:100002];
    [b3 setTag:100003];
    [b4 setTag:100004];

    
    [b1 addTarget:self action:@selector(topButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [b2 addTarget:self action:@selector(topButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [b3 addTarget:self action:@selector(topButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [b4 addTarget:self action:@selector(topButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    

    [self.view addSubview:b1];
    [self.view addSubview:b2];
    [self.view addSubview:b3];
    [self.view addSubview:b4];
    TopButtons = [[NSMutableArray alloc] initWithObjects:b1,b2,b3,b4, nil];
    
}

-(void)topButtonClicked:(TopButton*)sender{
    for(TopButton* button in TopButtons){
        [button setSelected:NO];
        button.imView.image = button.normal;
    }
    [sender setSelected:YES];
    sender.imView.image = sender.highlight;
    //sender.jsb.badgeText = [NSString stringWithFormat:@""];
    
    
    
    
    [mainScrollView setContentOffset:CGPointMake(SCREEN_WIDTH*(sender.tag - 100001), mainScrollView.contentOffset.y) animated:YES]; //设置scrollview的显示为当前滑动到的页面
    
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    for(TopButton * button in TopButtons){
        if(button.tag == mainScrollView.contentOffset.x/SCREEN_WIDTH+100001){
            [button setSelected:YES];
        }else{
            [button setSelected:NO];
        }
    }
}

-(void)editMainScrollView{
    mainScrollView = [[UIScrollView alloc]init];
    mainScrollView.frame = CGRectMake(0, BUTTON_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-BUTTON_HEIGHT-BUTTON_HEIGHT-NAVI_HEIGHT-SWITCH_HEIGHT);
    mainScrollView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:mainScrollView];
    
    mainScrollView.delegate = self;
    mainScrollView.pagingEnabled = YES;
    mainScrollView.bounces = NO;
    mainScrollView.showsVerticalScrollIndicator = NO;
    mainScrollView.showsVerticalScrollIndicator = NO;
    
    pageView1 = [[UIView1 alloc] initWithFrame:mainScrollView.bounds];
    [mainScrollView addSubview:pageView1];
    
    pageView2 = [[UIView2 alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, mainScrollView.frame.size.height)];
    [mainScrollView addSubview:pageView2];
    
    pageView3 = [[UIView3 alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 2, 0, self.view.frame.size.width, mainScrollView.frame.size.height)];
    [mainScrollView addSubview:pageView3];
    
    pageView4 = [[UIView4 alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 3, 0, self.view.frame.size.width, mainScrollView.frame.size.height)];
    [mainScrollView addSubview:pageView4];
    
    
    mainScrollView.contentSize = CGSizeMake(self.view.frame.size.width * 4, mainScrollView.frame.size.height);
    
}

-(void)editLinkButtons{
    [pageView1.b1 addTarget:self action:@selector(linkClicked:) forControlEvents:UIControlEventTouchUpInside];
    [pageView1.b2 addTarget:self action:@selector(linkClicked:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)linkClicked:(LinkButton*)sender{
    WebView * wv = [[WebView alloc]init];
    wv.URL = sender.URL;
    [wv loadRequest];
    [self.navigationController pushViewController:wv animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
