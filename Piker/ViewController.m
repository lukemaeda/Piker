//
//  ViewController.m
//  Piker
//
//  Created by MAEDA HAJIME on 2014/03/31.
//  Copyright (c) 2014年 MAEDA HAJIME. All rights reserved.
//

#import "ViewController.h"

// 表示データ定数　配列
NSString *const ITEM01[] = {
    @"トヨタ", @"ニッサン", @"マツダ", @"ホンダ", @"ミツビシ", @"スバル"
};

NSString *const ITEM02[] = {
    @"カワサキ", @"ヤマハ", @"ホンダ", @"スズキ"
};

@interface ViewController ()
// (DataSourceデータの元 @required:必須) (Delegate optional:任意)
 <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lbSelect;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    self.(UIPikerView).daterSource = self;
//    self.(UIPikerView).delegate    = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UIPickerViewDataSource Method

// 設定（コンポーネント数（列数））
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 2;
    
}

// 設定（行数）
// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView
 numberOfRowsInComponent:(NSInteger)component {
    
    NSInteger ret = 0;
    
    // コンポーネント判定
//    switch (component) {
//        case 0:
//            return sizeof(ITEM01) / sizeof(ITEM01[0]);
//            break;
//        case 1:
//            return sizeof(ITEM02) / sizeof(ITEM02[0]);
//            break;
//            
//        default:
//            break;
//    }
    
    switch (component) {
        case 0:
            ret = sizeof(ITEM01) / sizeof(ITEM01[0]);
            break;
        case 1:
            ret = sizeof(ITEM02) / sizeof(ITEM02[0]);
            break;
            
        default:
            break;
    }

//  return 1; // リターンが必要 この状態でも問題ない
    
    return ret; // この方が奇麗

}

#pragma mark - UIPickerViewDelegate Method

// 設定（文字列データ表示）
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row                 // 行
            forComponent:(NSInteger)component {         // 列
    
    NSString *ret = nil;
    
    // コンポーネント判定
    switch (component) {
        case 0:
            ret = ITEM01[row]; // 行に充てる
            break;
        case 1:
            ret = ITEM02[row]; // 行に充てる
            break;
            
        default:
            break;
    }
    
    return ret;
}

// データ選択時
- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component {
    
    // 選択行のインデックスを取得
    NSInteger row01 = [pickerView selectedRowInComponent:0];
    NSInteger row02 = [pickerView selectedRowInComponent:1];
    
    // 値の表示
    self.lbSelect.text = [NSString stringWithFormat:@"%@, %@", ITEM01[row01], ITEM02[row02]];
    
}

@end
