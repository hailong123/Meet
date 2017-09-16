//
//  HL_UserViewController.m
//  Meet
//
//  Created by JingHanit on 2017/8/3.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_UserViewController.h"

#import "HL_UserHeardView.h"

#import "HL_ConfigModel.h"
#import "HL_LocalModelHelper.h"

#import "HL_UserTableViewCell.h"

#import "HL_SettingViewController.h"
#import "HL_EditBaseInfoViewController.h"

@interface HL_UserViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource,
    userHeardViewDelegate
>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) HL_UserHeardView *heardView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation HL_UserViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self defaultConfig];
    
}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated {

    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

#pragma mark - Private Method
- (void)defaultConfig {
    
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.top.equalTo(self.view).offset(-20);
    }];
   
}

#pragma mark - Public Method

#pragma mark - Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource[section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section >= 4) {
        return 45;
    } else if (indexPath.section == 3) {
        return 180;
    } else {
        return 140;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    HL_UserTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:[HL_UserTableViewCell description]];

    cell.selectionStyle         = UITableViewCellSelectionStyleNone;
    
    HL_ConfigModel *configModel = self.dataSource[indexPath.section][indexPath.row];
    cell.configModel            = configModel;
    
    switch (indexPath.section) {
        case 0:
        {
            cell.type           = CellType_Certification;
            
        }
            break;
        case 1:
        {
            cell.type           = CellType_Marriage;
            cell.communityCount = 0;
        }
            break;
        case 2:
        {
            cell.type           = CellType_Dynamic;
            cell.communityCount = 0;
        }
            break;
        case 3:
        {
            cell.type = CellType_Photo;
            
            cell.photoArray = [@[@"",
                                @"icon",
                                @"icon",
                                @"icon",
                                @"icon"] mutableCopy];
        }
            break;
        case 5:
        {
            cell.type = CellType_Setting;
        }
            break;
    }
    
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section == 0?RELATIVE_HEIGHT(450):CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 8;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
      return section == 0?self.heardView:nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section == 2 && indexPath.row == 1) {
        
        HL_SettingViewController *settingVC = [[HL_SettingViewController alloc] init];
        settingVC.hidesBottomBarWhenPushed  = YES;
        
        [self.navigationController pushViewController:settingVC animated:YES];
    }

}

#pragma mark userHeardViewDelegate
- (void)userHeardView:(HL_UserHeardView *)userHeardView {

    HL_EditBaseInfoViewController *baseInfoVC = [[HL_EditBaseInfoViewController alloc] init];
    
    [self.navigationController pushViewController:baseInfoVC animated:YES];
    
}

#pragma mark - Setter And Getter

- (UITableView *)tableView {

    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero
                                                  style:UITableViewStyleGrouped];
        _tableView.delegate       = self;
        _tableView.dataSource     = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        
        
        [_tableView registerClass:[HL_UserTableViewCell class]
           forCellReuseIdentifier:[HL_UserTableViewCell description]];
        
    }
    
    return _tableView;
}

- (HL_UserHeardView *)heardView {

    if (!_heardView) {
        
        _heardView = [[HL_UserHeardView alloc] init];
        _heardView.heardViewDelegate = self;
        
    }
    
    return _heardView;
}

- (NSMutableArray *)dataSource {

    if (!_dataSource) {
        
        _dataSource = [HL_LocalModelHelper fetchUserDataWithoutSetting:NO];
    }
    
    return _dataSource;
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
