//
//  MainController.m
//  Test
//
//  Created by Dry on 15/12/8.
//  Copyright © 2015年 Dry. All rights reserved.
//

#import "MainController.h"
#import "OtherController.h"

@interface MainController ()

@end

@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"主页";
    
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.navigationController pushViewController:[[OtherController alloc]init] animated:YES];
}
@end
