//
//  HL_MainViewController.m
//  Meet
//
//  Created by JingHanit on 2017/8/3.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_MainViewController.h"

#import "HL_CommunityModel.h"

#import "HL_CommunityCell.h"

#import "HL_EditViewController.h"
#import "HL_SearchViewController.h"

@interface HL_MainViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource
>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSources;

@end

@implementation HL_MainViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self defaultConfig];
    
    [self createUI];
    
}
#pragma mark - Private Method

- (void)defaultConfig {

    [self setNavLeftBarItemWithImg:@"head-search"];
    [self setNavRightBarItemWithImg:@"head-write"];
    
}

- (void)createUI {

    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.view);
    }];
}

- (void)clickLeftBtnEvent:(UIButton *)leftBtn {

    HL_SearchViewController *searchVC = [[HL_SearchViewController alloc] init];
    searchVC.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:searchVC animated:YES];
}

- (void)clickRightBtnEvent:(UIButton *)rightBtn {
    
    HL_EditViewController *editVC   = [[HL_EditViewController alloc] init];
    editVC.type                     = EditViewTypeMarriage;
    
    [self.navigationController pushViewController:editVC animated:YES];
}

#pragma mark - Public Method

#pragma mark - Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSources.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return RELATIVE_HEIGHT(IPHONE5?780:480);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    HL_CommunityCell *communityCell = [tableView dequeueReusableCellWithIdentifier:[HL_CommunityCell description]];
    
    communityCell.communityModel = self.dataSources[indexPath.row];
    communityCell.cellType       = CommunityCellType_Main;
    
    return communityCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

#pragma mark - Setter And Getter

- (UITableView *)tableView {
    
    if (!_tableView) {
        
        _tableView            = [[UITableView alloc] initWithFrame:CGRectZero
                                                             style:UITableViewStyleGrouped];
        _tableView.delegate   = self;
        _tableView.dataSource = self;
        
        [_tableView registerClass:[HL_CommunityCell class]
           forCellReuseIdentifier:[HL_CommunityCell description]];
    }
    
    return _tableView;
}

- (NSMutableArray *)dataSources {

    if (!_dataSources) {
        
        _dataSources = [NSMutableArray array];
        
        HL_CommunityModel *communityModel = [[HL_CommunityModel alloc] init];
        
        communityModel.sex      = 1;
        communityModel.age      = @"80";
        communityModel.intro    = @"这是一个测试的简介";
        communityModel.iconImg  = @"icon";
        communityModel.nickName = @"测试昵称";
        communityModel.timeStamp = @"3分钟前";
        
        communityModel.praiseCount  = @"5";
        communityModel.messageCount = @"10";
        
        communityModel.photoImgArray = @[@"icon",@"icon",@"icon"];
        
        [_dataSources addObject:communityModel];
    }
    
    return _dataSources;
}

#pragma mark - Dealloc


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
