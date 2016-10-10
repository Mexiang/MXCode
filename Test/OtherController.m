//
//  OtherController.m
//  Test
//
//  Created by Dry on 15/12/8.
//  Copyright © 2015年 Dry. All rights reserved.
//

#import "OtherController.h"
#import "OtherControllerCell.h"

@interface OtherController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *sections;
@property (nonatomic, strong) NSArray *classNames;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation OtherController

//1、init方法初始化数据
- (instancetype)init {
    if (self = [super init]) {
        
        self.title = @"流水查询";
        
        [self initTitles];
        
        [self initClassNames];
    }
    return self;
}

//2、加载UI
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTableView];
}

#pragma mark 初始化数据
- (void)initTitles {
    NSArray *section1 = @[@"指派订单完成率查询"];
    
    NSArray *section2 = @[@"总单数",@"指派完成数",@"指派取消数"];
    
    NSArray *section3 = @[@"总流水",@"指派流水"];
    
    self.sections = [NSArray arrayWithObjects:section1,section2,section3, nil];
}
- (void)initClassNames {
    NSArray *section1ClassNames = @[@"AssignmentRateController"];
    
    NSArray *section2ClassNames = @[@"SingularController",@"",@""];
    
    NSArray *section3ClassNames = @[@"SingularController",@""];
    
    self.classNames = [NSArray arrayWithObjects:section1ClassNames,section2ClassNames,section3ClassNames, nil];
}
#pragma mark 搭建UI
- (void)initTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
    self.tableView.sectionHeaderHeight = 9.5;
    self.tableView.sectionFooterHeight = 0.5;
    self.tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 10)];
    
    [self.view addSubview:self.tableView];
}
#pragma mark UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _sections.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_sections[section] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"OtherController_cellID";
    
    OtherControllerCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[OtherControllerCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        if (indexPath.row == 0) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    
    cell.textLabel.text = _sections[indexPath.section][indexPath.row];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self.tableView reloadData];
    
    NSString *className = self.classNames[indexPath.section][indexPath.row];
    
    if (className.length) {
        UIViewController *controller = [[NSClassFromString(className) alloc] init];
        
        controller.title = _sections[indexPath.section][indexPath.row];
        
        [self.navigationController pushViewController:controller animated:YES];
    }
}

@end
