//
//  YCAlertControllerBiz.m
//  ios.calendar
//
//  Created by yangc on 16/6/27.
//  Copyright © 2016年 yangc. All rights reserved.
//

#import "YCAlertControllerBiz.h"

@implementation YCAlertControllerBiz

+ (UIAlertController *)alertControllerWithPickerView:(UIView *)pickerView settingAction:(void (^)())settingAction todayAction:(void (^)())todayAction {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"\n\n\n\n\n\n\n\n\n\n\n" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alertController.view addSubview:pickerView];

    UIAlertAction *setting = [UIAlertAction actionWithTitle:@"设置"
                                                      style:UIAlertActionStyleDefault
                                                    handler:^(UIAlertAction *_Nonnull action) {
                                                        settingAction();
                                                    }];
    UIAlertAction *today = [UIAlertAction actionWithTitle:@"今天"
                                                    style:UIAlertActionStyleDefault
                                                  handler:^(UIAlertAction *_Nonnull action) {
                                                      todayAction();
                                                  }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:setting];
    [alertController addAction:today];
    [alertController addAction:cancel];
    return alertController;
}

@end
