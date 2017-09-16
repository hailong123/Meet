//
//  HL_CommunityViewController.m
//  Meet
//
//  Created by JingHanit on 2017/8/3.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_CommunityViewController.h"

#import "HL_CommunityCell.h"

#import "HL_CommunityModel.h"

#import "HL_EditViewController.h"
#import "HL_UserViewController.h"

@interface HL_CommunityViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource,
    HL_CommunityCellDelegate
>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@property (nonatomic, strong) UIButton *addBtn;

@end

@implementation HL_CommunityViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];

    [self defaultConfig];
    
}

- (void)defaultConfig {

    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.view);
    }];
    
    [self.view addSubview:self.addBtn];
    
    [self.addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(RELATIVE_X(-30));
        make.bottom.equalTo(self.view).offset(RELATIVE_Y(-90-44));
        make.size.mas_equalTo(CGSizeMake(RELATIVE_WIDTH(90), RELATIVE_HEIGHT(90)));
    }];
}

#pragma mark - Private Method

- (void)clickAddBtn:(UIButton *)btn {

    HL_EditViewController *editVC = [[HL_EditViewController alloc] init];
    editVC.type                   = EditViewTypeCommunity;
    
    [self.navigationController pushViewController:editVC animated:YES];
}

#pragma mark - Public Method

#pragma mark - Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return RELATIVE_HEIGHT(IPHONE5?780:IPHONE6_PLUS?980:880);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    HL_CommunityCell *cell = [tableView dequeueReusableCellWithIdentifier:[HL_CommunityCell description]];
    
    cell.cellType       = CommunityCellType_Community;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.communityModel = self.dataSource[indexPath.row];
    
    cell.communityCellDelegate = self;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

#pragma mark HLCommunityCellDelegate
- (void)communityCell:(HL_CommunityCell *)communityCell {

    HL_UserViewController *userVC = [[HL_UserViewController alloc] init];
    
    [self.navigationController pushViewController:userVC animated:YES];
}

#pragma mark - Setter And Getter

- (UITableView *)tableView {

    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero
                                                  style:UITableViewStyleGrouped];
        _tableView.delegate   = self;
        _tableView.dataSource = self;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerClass:[HL_CommunityCell class]
           forCellReuseIdentifier:[HL_CommunityCell description]];
    }
    
    return _tableView;
}

- (NSMutableArray *)dataSource {

    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
        
        HL_CommunityModel *communityModel = [[HL_CommunityModel alloc] init];
        
        communityModel.sex      = 1;
        communityModel.age      = @"80";
        communityModel.intro    = @"这是一个测试的简介";
        communityModel.iconImg  = @"icon";
        communityModel.nickName = @"测试昵称";
        communityModel.timeStamp = @"3分钟前";
        
        communityModel.praiseCount  = @"5";
        communityModel.messageCount = @"10";
        
        communityModel.photoImgArray = @[@"icon2",@"icon",@"icon2",
                                         @"icon",@"icon2",@"icon",
                                         @"icon2",];
        
        [_dataSource addObject:communityModel];
    }
    
    return _dataSource;
}

- (UIButton *)addBtn {

    if (!_addBtn) {
        
        _addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addBtn addTarget:self
                    action:@selector(clickAddBtn:)
          forControlEvents:UIControlEventTouchUpInside];
        
        [_addBtn setBackgroundImage:[UIImage imageNamed:@"news-write"]
                           forState:UIControlStateNormal];
    }
    
    return _addBtn;
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
