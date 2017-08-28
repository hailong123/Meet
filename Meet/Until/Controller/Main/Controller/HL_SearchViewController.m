//
//  HL_SearchViewController.m
//  Meet
//
//  Created by JingHanit on 2017/8/8.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_SearchViewController.h"

#import "HL_SearchCell.h"

@interface HL_SearchViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource,
    UISearchBarDelegate
>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UISearchBar *searchBar;

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
    return section == 0 ? 44:CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return self.searchBar;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    HL_SearchCell *cell    = [tableView dequeueReusableCellWithIdentifier:[HL_SearchCell description]];

    return cell;
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

- (UISearchBar *)searchBar {

    if (!_searchBar) {
        
        _searchBar          = [[UISearchBar alloc] init];
        _searchBar.delegate = self;
    }
    
    return _searchBar;
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
