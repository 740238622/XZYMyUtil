//
//  XZYMyUtil.h
//  XZYMyUtil
//
//  Created by 徐自由 on 2017/12/20.
//  Copyright © 2017年 徐自由. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XZYMyUtil : NSObject

#pragma mark - 1.0.0
#pragma mark - UIView
/**
 添加view
 
 @param rect 位置大小
 @param viewA 要添加到的view
 @param color 背景颜色
 @return return value description
 */
+ (UIView *)viewWithRect:(CGRect)rect backgroundColor:(UIColor *)color view:(UIView *)viewA;

/**
 添加线条
 
 @param rect 位置大小
 @param color 线条颜色
 @param viewA 要添加到的view
 @return return value description
 */
+ (UIView *)setLineViewRect:(CGRect)rect LineColor:(UIColor *)color view:(UIView *)viewA;

/**
 添加虚线
 
 @param lineFrame 位置大小
 @param view 要添加到的view
 @param length 虚线长度
 @param spacing 虚线间隔
 @param color 虚线颜色
 @return return value description
 */
+ (UIView *)createDashedLineWithFrame:(CGRect)lineFrame view:(UIView *)view lineLength:(int)length lineSpacing:(int)spacing lineColor:(UIColor *)color;

#pragma mark - UILabel
/**
 添加label
 
 @param rect 位置大小
 @param text 显示内容
 @param font 显示字体大小
 @param alignment 文字排版
 @param color 字体颜色
 @param tag tag
 @param viewA 要添加到的view
 @return return value description
 */
+ (UILabel *)labelWithRect:(CGRect)rect name:(NSString *)text fontSize:(CGFloat)font Alignment:(NSTextAlignment)alignment Color:(UIColor *)color Tag:(NSInteger)tag view:(UIView *)viewA;

#pragma mark - UIButton
/**
 添加按钮
 
 @param rect 位置大小
 @param photo 背景图片
 @param hphoto 高亮图片
 @param title 文字
 @param sel 调用方法
 @param tag tag
 @param textColor 文字颜色
 @param font 字体大小
 @param viewA 添加到的view
 @return return value description
 */
+ (UIButton *)buttonWithRect:(CGRect)rect backgroundPhoto:(NSString*)photo hilPhoto:(NSString*)hphoto title:(NSString *)title target:(id)target select:(SEL)sel tag:(NSInteger)tag textColor:(UIColor *)textColor fontSize:(CGFloat)font backgroundColor:(UIColor *)backColor view:(UIView *)viewA;

#pragma mark - UITextField
/**
 添加输入框
 
 @param rect 位置大小
 @param tag tag
 @param color 文字颜色
 @param alignment 文字排版
 @param textStr 文字
 @param placeholderStr 提示文字
 @param viewA 添加到的view
 @return return value description
 */
+ (UITextField *)textFieldWithRect:(CGRect)rect tag:(NSInteger)tag textColor:(UIColor*)color Alignment:(NSTextAlignment)alignment Text:(NSString*)textStr placeholderStr:(NSString *)placeholderStr fontSize:(CGFloat)font View:(UIView*)viewA;

#pragma mark - UITableView
/**
 添加列表
 
 @param rect 位置大小
 @param tag tag
 @param delegate delegate
 @param dataSource dataSource
 @param viewA 添加到的view
 @return return value description
 */
+ (UITableView *)tableViewWithRect:(CGRect)rect tag:(NSInteger)tag delegate:(id<UITableViewDelegate>)delegate dataSource:(id<UITableViewDataSource>)dataSource view:(UIView *)viewA;

#pragma mark - UIScrollView
/**
 添加滚动视图
 
 @param rect 位置大小
 @param tag tag
 @param contentSize 滚动范围
 @param viewA 添加到的view
 @return return value description
 */
+ (UIScrollView *)scrrollViewWithRect:(CGRect)rect tag:(NSInteger)tag contentSize:(CGSize)contentSize view:(UIView *)viewA;

#pragma mark - 16进制转color
/**
 16进制转color
 
 @param hexColor 16进制
 @return return value description
 */
+ (UIColor *)getColor:(NSString *)hexColor;

#pragma mark - 计算文字高度
/**
 计算文字高度
 
 @param string 文字
 @param font 字体大小
 @param with 长度
 @return return value description
 */
+ (CGSize)stringWithText:(NSString *)string font:(NSInteger)font with:(CGFloat)with;

#pragma mark - 计算文字长度
/**
 计算文字长度
 
 @param string 文字
 @param font 字体大小
 @param heigh 高度
 @return return value description
 */
+ (CGSize)stringWithText:(NSString *)string font:(NSInteger)font heigh:(CGFloat)heigh;

#pragma mark - 判断对象是否为空
/**
 判断对象是否为空
 
 @param obj 对象
 @return return value description
 */
+ (BOOL)isEmpty:(id)obj;

#pragma mark - 比较2个日期的大小
/**
 比较2个日期的大小
 
 @param firstDate 第一个日期
 @param secondDate 第二个日期
 @return return value description
 */
+ (BOOL)JudgeTwoDate:(NSString *)firstDate secondDate:(NSString *)secondDate;
#pragma mark - 比较2个时间的大小
/**
 比较2个时间的大小
 
 @param firstDate 第一个时间
 @param secondDate 第二个时间
 @return return value description
 */
+ (BOOL)JudgeTwoTime:(NSString *)firstDate secondDate:(NSString *)secondDate;

#pragma mark - 获取现在日期
/**
 获取现在日期
 
 @return return value description
 */
+ (NSString *)getNowDate;

#pragma marl - 获取现在时间
/**
 获取现在时间
 
 @return return value description
 */
+ (NSString *)getNowTime;

#pragma mark - 获取当前时间戳
/**
 获取当前时间戳
 
 @return return value description
 */
+ (NSString *)getNowTimeStamp;

#pragma mark - 判断字符串是否是纯数字
/**
 判断是否为纯数字
 
 @param numStr 字符串
 @return return value description
 */
+ (BOOL)isPureNumber:(NSString *)numStr;

#pragma mark - 判断字符串是否为整形
/**
 判断是否为整形
 
 @param string 字符串
 @return return value description
 */
+ (BOOL)isPureInt:(NSString *)string;

#pragma mark - 判断字符串是否为浮点型
/**
 判断是否为整形
 
 @param string 字符串
 @return return value description
 */
+ (BOOL)isPureFloat:(NSString *)string;

#pragma mark - 1.0.1
#pragma mark - 手机号正则
/**
 手机号正则

 @param mobileNum 手机号码
 @return return value description
 */
+ (BOOL)validateMobile:(NSString *)mobileNum;

#pragma mark - 查看应用程序版本
/**
 查看应用程序版本

 @return return value description
 */
+ (NSString *)getVersion;
#pragma mark - 查看手机系统版本
/**
 查看手机系统版本

 @return return value description
 */
+ (NSString *)getSystemVersion;

#pragma mark - 1.0.4
#pragma marl - UIImageView
+ (UIImageView *)imageViewWithImage:(NSString *)image rect:(CGRect)rect tag:(int)tag viewA:(UIView *)viewA;

@end
