//
//  HL_RegistUpHeardImgViewController.m
//  Meet
//
//  Created by JingHanit on 2017/8/3.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_RegistUpHeardImgViewController.h"

#import "JHPickView.h"
#import "HL_PhotoManager.h"
#import "HL_LocalModelHelper.h"

#import "HL_ConfigModel.h"

#import "HL_RegisteFinishViewController.h"

@interface HL_RegistUpHeardImgViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource,
    JHPickerDelegate
>

@property (nonatomic, strong) UIButton *nextBtn;
@property (nonatomic, strong) UIButton *heardImgBtn;

@property (nonatomic, strong) UILabel *nickNameLbl;

@property (nonatomic, strong) UIView *footView;
@property (nonatomic, strong) UIView *heardView;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSources;

@property (nonatomic, strong) HL_PhotoManager *photoManager;

@end

@implementation HL_RegistUpHeardImgViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self defaultConfig];
    
    [self fetchDataSource];
    
    [self createUI];
}

#pragma mark - Private Method

- (void)defaultConfig {

    [self setNavNormalTitleWithTitle:@"完善资料"];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)fetchDataSource {

    self.dataSources = [HL_LocalModelHelper fetchRegisterData];
    
    [self.tableView reloadData];
}

- (void)createUI {

    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
}

- (void)clickNextBtn:(UIButton *)btn {
    
    switch (btn.tag) {
        case 100:
        {
            __weak typeof(*&self)weakSelf = self;
            
            [self.photoManager choosePhotoWithController:self completion:^(UIImage * _Nonnull img) {
                [weakSelf.heardImgBtn setImage:img forState:UIControlStateNormal];
            }];
            
        }
            break;
            
        case 200:
        {
            HL_RegisteFinishViewController *finishVC = [[HL_RegisteFinishViewController alloc] init];
            
            [self.navigationController pushViewController:finishVC animated:YES];
        }
            break;
    }
    
}

#pragma mark - Public Method

#pragma mark - Delegate

//UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSources.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[UITableViewCell description]];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                      reuseIdentifier:[UITableViewCell description]];
        cell.accessoryType       = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.textColor = [UIColor grayColor];
    }
    
    HL_ConfigModel *model = self.dataSources[indexPath.row];
    cell.textLabel.text   = model.title;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    JHPickView *pickView = [[JHPickView alloc] initWithFrame:self.view.bounds];
    
    switch (indexPath.row) {
        case 0:
        {
            pickView.arrayType  = DeteArray;
        }
            break;
        case 1:
        {
             pickView.arrayType = HeightArray;
        }
            break;
        case 2:
        {
             pickView.arrayType = AreaArray;
        }
            break;
        case 3:
        {
             pickView.arrayType = GenderArray;
        }
            break;
        default:
            break;
    }
    
     pickView.delegate = self;
     pickView.indexRow = indexPath.row;
    
    [self.view addSubview: pickView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return (self.view.width/3);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return (self.view.width/3)*1.75;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return self.footView;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return self.heardView;
}

//JHPickerViewDelegate
- (void)PickerSelectorIndixString:(NSString *)str indexRow:(NSInteger)row {

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
    
    UITableViewCell *cell       = [self.tableView cellForRowAtIndexPath:indexPath];
    cell.detailTextLabel.text   = str;
    
}

#pragma mark - Setter And Getter

- (void)setNickNameTitle:(NSString *)nickNameTitle {
    
    _nickNameTitle        = nickNameTitle;
    self.nickNameLbl.text = self.nickNameTitle;
}

- (NSMutableArray *)dataSources {

    if (!_dataSources) {
        _dataSources = [NSMutableArray arrayWithCapacity:0];
    }
    
    return _dataSources;
}

- (UITableView *)tableView {

    if (!_tableView) {
        
        _tableView               = [[UITableView alloc] initWithFrame:CGRectZero
                                                                style:UITableViewStylePlain];
        _tableView.delegate        = self;
        _tableView.dataSource      = self;
        _tableView.rowHeight       = 55;
        _tableView.scrollEnabled   = NO;
        _tableView.tableFooterView = [UIView new];
    }
    
    return _tableView;
}

- (UIButton *)nextBtn {

    if (!_nextBtn) {
        
        _nextBtn       = [UIButton buttonWithType:UIButtonTypeCustom];
        _nextBtn.tag   = 200;

        _nextBtn.titleLabel.font = [UIFont systemFontOfSize:20 weight:15];
        _nextBtn.backgroundColor = [UIColor colorWithHexString:@"#BABBBC"];
        
        _nextBtn.layer.masksToBounds = YES;
        _nextBtn.layer.cornerRadius  = 55/2;
        
        [_nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_nextBtn setTitle:MEET_REGIST_NEXTBTN_TITILE forState:UIControlStateNormal];
        [_nextBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        
        [_nextBtn addTarget:self
                     action:@selector(clickNextBtn:)
           forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _nextBtn;
}

- (UIButton *)heardImgBtn {
    
    if (!_heardImgBtn) {
        
        _heardImgBtn             = [UIButton buttonWithType:UIButtonTypeCustom];
        _heardImgBtn.tag         = 100;
        _heardImgBtn.size        = CGSizeMake(self.view.width/4, self.view.width/4);
        _heardImgBtn.center      = self.heardView.center;
        _heardImgBtn.contentMode = UIViewContentModeCenter;
        _heardImgBtn.layer.masksToBounds = YES;
        _heardImgBtn.layer.cornerRadius  = 8;
        
        [_heardImgBtn setImage:[UIImage imageNamed:@"addhd-ico"] forState:UIControlStateNormal];
        [_heardImgBtn addTarget:self action:@selector(clickNextBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _heardImgBtn;
}

- (UILabel *)nickNameLbl {
 
    if (!_nickNameLbl) {
        
        _nickNameLbl           = [[UILabel alloc] init];
        _nickNameLbl.font      = [UIFont systemFontOfSize:20];
        _nickNameLbl.textColor     = [UIColor redColor];
        _nickNameLbl.textAlignment = NSTextAlignmentCenter;
        
    }
    
    return _nickNameLbl;
}


- (UIView *)heardView {
    
    if (!_heardView) {
        _heardView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width,
                                                              (self.view.width/3)*2)];
        
        [_heardView addSubview:self.heardImgBtn];
        [_heardView addSubview:self.nickNameLbl];
        
        [self.nickNameLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_heardView);
            make.right.equalTo(_heardView);
            make.height.equalTo(@20).priorityLow(250);
            make.top.equalTo(self.heardImgBtn.mas_bottom).offset(20);
        }];
    }
    
    return _heardView;
}

- (UIView *)footView {

    if (!_footView) {
        
        _footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width,
                                                             CGRectGetWidth(self.view.frame)/3*1.5)];
        
        UILabel *lbl      = [[UILabel alloc] init];
        lbl.text          = MEET_REGIST_MODIFY_SEX_TITLE;
        lbl.font          = [UIFont systemFontOfSize:15 weight:10];
        lbl.textColor     = [UIColor colorWithHexString:@"#BABBBC"];
        lbl.textAlignment = NSTextAlignmentLeft;
        
        [_footView addSubview:lbl];
        [_footView addSubview:self.nextBtn];
        
        [lbl sizeToFit];
        [lbl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_footView).offset(10);
            make.left.equalTo(_footView).offset(20);
        }];
        
        [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lbl);
            make.height.equalTo(@55);
            make.bottom.equalTo(_footView);
            make.width.mas_equalTo(CGRectGetWidth(self.view.frame) - 20*2);
        }];
    }
    
    return _footView;
}

- (HL_PhotoManager *)photoManager {

    if (!_photoManager) {
        _photoManager = [[HL_PhotoManager alloc] init];
    }
    
    return _photoManager;
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
