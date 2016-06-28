//
//  YCAlertControllerBiz.h
//  ios.calendar
//
//  Created by yangc on 16/6/27.
//  Copyright © 2016年 yangc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCAlertControllerBiz : NSObject

+ (UIAlertController *)alertControllerWithPickerView:(UIView *)pickerView settingAction:(void (^)())settingAction todayAction:(void (^)())todayAction;

@end
