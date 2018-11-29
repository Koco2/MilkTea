//
//  LinkButton.h
//  MilkTea
//
//  Created by Chen Wang on 8/16/18.
//  Copyright © 2018 Chen Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LinkButton : UIButton

-(instancetype)initWithFrame:(CGRect)frame;
@property(nonatomic,strong)NSURL *URL;
-(void)addImage:(UIImage*)image Title:(NSString*)title Link:(NSURL*)link;
@end
