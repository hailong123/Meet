//
//  HL_SearchViewController.m
//  Meet
//
//  Created by JingHanit on 2017/8/8.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_SearchViewController.h"

#import "HL_SearchView.h"
#import "HL_SearchCell.h"

#import "HL_SearchDetailViewController.h"

@interface HL_SearchViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource,
    SearchViewDelegate
>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) HL_SearchView *searchView;

@property (nonatomic, strong) NSMutableArray *dataSources;

@end

@implementation HL_SearchViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self defaultConfig];
}

#pragma mark - Private Method
- (void)defaultConfig {

    [self setNavNormalTitleWithTitle:@"搜索"];
    
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.view);
    }];
    
    CGImageRef ref = [UIImage imageNamed:@"search-bg"].CGImage;
    
    self.tableView.layer.contents = (__bridge id _Nullable)(ref);
}

#pragma mark - Public Method


#pragma mark - Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section == 0 ? 35*2:CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *view = [[UIView alloc] init];
    
    [view addSubview:self.searchView];
    
    [self.searchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view);
        make.right.equalTo(view);
        make.bottom.equalTo(view);
        make.top.equalTo(view).offset(RELATIVE_Y(40));
    }];
    
    return view;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    HL_SearchCell *cell    = [tableView dequeueReusableCellWithIdentifier:[HL_SearchCell description]];

    return cell;
}

#pragma mark TouchDelegate
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

#pragma mark SearchViewDelegate
- (void)searchViewDelegate:(HL_SearchView *)searchView searchStr:(NSString *)searchStr {

    [self.view endEditing:YES];
    
    HL_SearchDetailViewController *searchDetailVC = [[HL_SearchDetailViewController alloc] init];
    
    [self.navigationController pushViewController:searchDetailVC animated:YES];

}

#pragma mark - Setter And Getter
- (UITableView *)tableView {

    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero
                                                  style:UITableViewStyleGrouped];
        _tableView.delegate   = self;
        _tableView.dataSource = self;
        
        _tableView.rowHeight      = 60;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerClass:[HL_SearchCell class]
           forCellReuseIdentifier:[HL_SearchCell description]];
    }
    
    return _tableView;
}

- (HL_SearchView *)searchView {
 
    if (!_searchView) {
        _searchView = [[HL_SearchView alloc] init];
        _searchView.delegate = self;
    }
    
    return _searchView;
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
