//
//  HL_SettingViewController.m
//  Meet
//
//  Created by SeaDragon on 2017/8/7.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_SettingViewController.h"

#import "HL_ConfigModel.h"
#import "HL_LocalModelHelper.h"

#import "HL_SettingCell.h"

@interface HL_SettingViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource
>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation HL_SettingViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self defaultConfig];
}

#pragma mark - Private Method

- (void)defaultConfig {

    [self setNavRightBarItemWithTittle:@"保存"];
    [self setNavNormalTitleWithTitle:@"编辑基本信息"];
    
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.view);
    }];
}

- (void)clickRightBtnEvent:(UIButton *)rightBtn {

}

#pragma mark - Publish Method

#pragma mark - Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource[section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return section == 0?8:CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    HL_SettingCell *cell        = [tableView dequeueReusableCellWithIdentifier:[HL_SettingCell description]];
    
    HL_ConfigModel *configModel = self.dataSource[indexPath.section][indexPath.row];
    cell.configModel            = configModel;
    
    return cell;
}

#pragma mark - Setter And Getter

- (UITableView *)tableView {

    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero
                                                  style:UITableViewStyleGrouped];
        _tableView.delegate   = self;
        _tableView.dataSource = self;
        
        _tableView.rowHeight  = 60;
        
        [_tableView registerClass:[HL_SettingCell class]
           forCellReuseIdentifier:[HL_SettingCell description]];
        
        _tableView.separatorInset = UIEdgeInsetsZero;
        
    }
    
    return _tableView;
}

- (NSMutableArray *)dataSource {

    if (!_dataSource) {
        _dataSource = [HL_LocalModelHelper fetchEditBaseInfo];
    }

    return _dataSource;
}

#pragma Delloc

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
