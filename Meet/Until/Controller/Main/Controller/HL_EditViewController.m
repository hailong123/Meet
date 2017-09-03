//
//  HL_EditViewController.m
//  Meet
//
//  Created by JingHanit on 2017/8/8.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#import "HL_EditViewController.h"

#import "HL_TextView.h"
#import "HL_AddPhotoScrollerView.h"

@interface HL_EditViewController ()
<
    HL_AddPhotoScrollerViewDelegate,
    TZImagePickerControllerDelegate
>

@property (nonatomic, strong) HL_TextView *textView;
@property (nonatomic, strong) HL_AddPhotoScrollerView *photoScrollView;

@end

@implementation HL_EditViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self defaultConfig];
    
    [self createUI];
}

#pragma mark - Private Method

- (void)defaultConfig {

    [self navConfig];
    
    [self notificatkeyBoard];
}

- (void)navConfig {
    
    NSString *title = nil;

    switch (_type) {
        case EditViewTypeMarriage:
        {
            title = @"发布征婚";
            self.textView.placeholder = @"个人简介, 不少于三张照片, 对另一半的想法.";
        }
            break;
            
        case EditViewTypeCommunity:
        {
            title = @"发布动态";
            self.textView.placeholder = @"发布动态";
        }
            break;
    }
    self.title = title;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setNavLeftBarItemWithTitle:@"取消"];
    [self setNavRightBarItemWithTittle:@"发布"];
    
}

- (void)createUI {

    //文本输入框
    [self.view addSubview:self.textView];
    
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view).offset(RELATIVE_X(30));
        make.right.equalTo(self.view).offset(RELATIVE_X(-30));
        make.height.mas_equalTo(kScreenHeight).multipliedBy(0.5);
    }];
    
    //图片
    [self.view addSubview:self.photoScrollView];
    
    [self.photoScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.height.mas_equalTo(RELATIVE_HEIGHT(250));
    }];
}

- (void) notificatkeyBoard {

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(KeyboardWillHidden:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];

    
}

- (void)keyboardWillShow:(NSNotification *)noti {
    
    NSValue *aValue    = noti.userInfo[UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    
    [self.photoScrollView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.mas_equalTo(RELATIVE_HEIGHT(250));
        make.bottom.mas_equalTo(-keyboardRect.size.height);
    }];

}

- (void)KeyboardWillHidden:(NSNotification *)noti {

    [self.photoScrollView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.mas_equalTo(self.view);
        make.height.mas_equalTo(RELATIVE_HEIGHT(250));
    }];
    
}

#pragma mark - Public Method

#pragma mark - Delegate

#pragma mark HL_AddPhotoScrollerViewDelegate
- (void)addPhotoScrollerView:(HL_AddPhotoScrollerView *)scrollerView {

    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9
                                                                                        columnNumber:4
                                                                                            delegate:self
                                                                                   pushPhotoPickerVc:YES];
    
    [self presentViewController:imagePickerVc animated:YES completion:nil];
    
}

- (void)imagePickerController:(TZImagePickerController *)picker
       didFinishPickingPhotos:(NSArray<UIImage *> *)photos
                 sourceAssets:(NSArray *)assets
        isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto
                        infos:(NSArray<NSDictionary *> *)infos {

    [self.photoScrollView.photoArray insertObjects:photos atIndex:0];
    
    [self.photoScrollView.collectionView reloadData];
    
}

#pragma mark - Setter And Getter

- (HL_TextView *)textView {

    if (!_textView) {
        
        _textView = [[HL_TextView alloc] init];
        
    }
    
    return _textView;
}

- (HL_AddPhotoScrollerView *)photoScrollView {

    if (!_photoScrollView) {
        _photoScrollView = [[HL_AddPhotoScrollerView alloc] init];
        _photoScrollView.backgroundColor = [UIColor redColor];
        
        _photoScrollView.photoArray = [@[@""] mutableCopy];
        _photoScrollView.scrollerViewDelegate = self;
    }
    
    return _photoScrollView;
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
