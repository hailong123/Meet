//
//  HL_EditBaseInfoViewController.m
//  Meet
//
//  Created by SeaDragon on 2017/8/24.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_EditBaseInfoViewController.h"

#import "HL_EditBaseInfoView.h"

static NSString * const kEditBaseInfoCellIdentifier = @"kEditBaseInfoCellIdentifier";

@interface HL_EditBaseInfoViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource
>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *dataSources;

@property (nonatomic, strong) HL_EditBaseInfoView *baseInfoView;

@end

@implementation HL_EditBaseInfoViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self editBaseInfoDefaultConfig];
    
    [self createEditBaseInfoUI];
}

#pragma mark - Private Method

- (void)editBaseInfoDefaultConfig {

    [self setNavRightBarItemWithTittle:@"保存"];
    [self setNavNormalTitleWithTitle:@"编辑基本信息"];
    
}

- (void)createEditBaseInfoUI {
    
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.right.bottom.equalTo(self.view);
    }];
}

- (void)clickRightBtnEvent:(UIButton *)rightBtn {
    

}

#pragma mark - Publish Method

#pragma mark - Delegate

//UITableVeiwDataSoures
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSources.count;
}

//UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:kEditBaseInfoCellIdentifier];
    
    if (!tableViewCell) {
        tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                               reuseIdentifier:kEditBaseInfoCellIdentifier];
        
        tableViewCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }
    
    tableViewCell.textLabel.text            = self.dataSources[indexPath.row];
    tableViewCell.detailTextLabel.text      = self.dataSources[indexPath.row];
    tableViewCell.detailTextLabel.textColor = [UIColor redColor];
    
    return tableViewCell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return self.baseInfoView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return RELATIVE_HEIGHT(450);
}

#pragma mark - Setter And Getter

- (UITableView *)tableView {

    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero
                                                  style:UITableViewStyleGrouped];
        
        _tableView.delegate        = self;
        _tableView.dataSource      = self;
        _tableView.rowHeight       = RELATIVE_HEIGHT(120);
        _tableView.separatorInset  = UIEdgeInsetsZero;
        _tableView.tableFooterView = [UIView new];
        
    }
    
    return _tableView;
}

- (NSArray *)dataSources {

    if (!_dataSources) {
        
        _dataSources = @[@"昵称",@"生日",@"身高",@"现居城市"];
    }
    
    return _dataSources;
}

- (HL_EditBaseInfoView *)baseInfoView {

    if (!_baseInfoView) {
        
        _baseInfoView = [[HL_EditBaseInfoView alloc] init];
    }
    
    return _baseInfoView;
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
