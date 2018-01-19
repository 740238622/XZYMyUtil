//
//  XZYMyUtil.m
//  XZYMyUtil
//
//  Created by 徐自由 on 2017/12/20.
//  Copyright © 2017年 徐自由. All rights reserved.
//

#import "XZYMyUtil.h"

@implementation XZYMyUtil

#pragma mark - UIView
+ (UIView *)viewWithRect:(CGRect)rect backgroundColor:(UIColor *)color view:(UIView *)viewA
{
    UIView *view = [UIView new];
    view.frame = rect;
    view.backgroundColor = color;
    [viewA addSubview:view];
    return view;
}

+ (UIView *)setLineViewRect:(CGRect)rect LineColor:(UIColor *)color view:(UIView *)viewA
{
    UIView *view = [self viewWithRect:rect backgroundColor:color view:viewA];
    return view;
}

+ (UIView *)createDashedLineWithFrame:(CGRect)lineFrame view:(UIView *)view lineLength:(int)length lineSpacing:(int)spacing lineColor:(UIColor *)color
{
    UIView *dashedLine = [[UIView alloc] initWithFrame:lineFrame];
    dashedLine.backgroundColor = [UIColor clearColor];
    [view addSubview:dashedLine];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:dashedLine.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(dashedLine.frame) / 2, CGRectGetHeight(dashedLine.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    [shapeLayer setStrokeColor:color.CGColor];
    [shapeLayer setLineWidth:CGRectGetHeight(dashedLine.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:length], [NSNumber numberWithInt:spacing], nil]];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(dashedLine.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    [dashedLine.layer addSublayer:shapeLayer];
    
    return dashedLine;
}

#pragma mark - UILabel
+ (UILabel *)labelWithRect:(CGRect)rect name:(NSString *)text fontSize:(CGFloat)font Alignment:(NSTextAlignment)alignment Color:(UIColor *)color Tag:(NSInteger)tag view:(UIView *)viewA
{
    UILabel *label = [UILabel new];
    label.frame = rect;
    label.text = text;
    label.font = [UIFont systemFontOfSize:font];
    label.textAlignment = alignment;
    label.textColor = color;
    label.tag = tag;
    label.numberOfLines = 0;
    [viewA addSubview:label];
    
    return label;
}

#pragma mark - UIButton
+ (UIButton *)buttonWithRect:(CGRect)rect backgroundPhoto:(NSString*)photo hilPhoto:(NSString*)hphoto title:(NSString *)title target:(id)target select:(SEL)sel tag:(NSInteger)tag textColor:(UIColor *)textColor fontSize:(CGFloat)font backgroundColor:(UIColor *)backColor view:(UIView *)viewA
{
    if ([photo isEqualToString:@""]) {
        photo = @"为了防止控制台出现垃圾提示，在这做判断";
    }
    if ([hphoto isEqualToString:@""]) {
        hphoto = @"为了防止控制台出现垃圾提示，在这做判断";
    }
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = rect;
    [btn setBackgroundImage:[UIImage imageNamed:photo] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:hphoto] forState:UIControlStateHighlighted];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    btn.tag = tag;
    [btn setTitleColor:textColor forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:font];
    [btn setBackgroundColor:backColor];
    [viewA addSubview:btn];
    return btn;
}

#pragma mark - UITextField
+ (UITextField *)textFieldWithRect:(CGRect)rect tag:(NSInteger)tag textColor:(UIColor*)color Alignment:(NSTextAlignment)alignment Text:(NSString*)textStr placeholderStr:(NSString *)placeholderStr fontSize:(CGFloat)font View:(UIView*)viewA
{
    UITextField *textField = [UITextField new];
    textField.frame = rect;
    textField.tag = tag;
    textField.textColor = color;
    textField.textAlignment = alignment;
    textField.text = textStr;
    textField.placeholder = placeholderStr;
    textField.font = [UIFont systemFontOfSize:font];
    
    [textField setBackgroundColor:[UIColor clearColor]];
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textField.borderStyle = UITextBorderStyleNone;
    
    //点击textfield上移
    [textField addTarget:self action:@selector(textFieldUp) forControlEvents:UIControlEventEditingDidBegin];
    
    //点击键盘return复位
    [textField addTarget:self action:@selector(textFieldDown) forControlEvents:UIControlEventEditingDidEndOnExit];
    [viewA addSubview:textField];
    
    return textField;
}

//动画，配置UItextField使用，使键盘上移，下移回位
+(void)donghuaView:(UIView*)view  Rect:(CGRect)rect{
    [UIView beginAnimations:@"animationID" context:nil];
    [UIView setAnimationDuration:0.35f];
    [view setFrame:rect];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:view cache:YES];
    [UIView commitAnimations];
}
+(void)textFieldUp
{
    /*
     配合
     +(void)donghuaView:(UIView*)view  Rect:(CGRect)rect{
     使用
     
     */
}

+(void)textFieldDown
{
    /*
     配合
     +(void)donghuaView:(UIView*)view  Rect:(CGRect)rect{
     使用
     
     */
}

#pragma mark - UITableView
+ (UITableView *)tableViewWithRect:(CGRect)rect tag:(NSInteger)tag delegate:(id<UITableViewDelegate>)delegate dataSource:(id<UITableViewDataSource>)dataSource view:(UIView *)viewA
{
    UITableView *tableview = [[UITableView alloc] initWithFrame:rect style:UITableViewStylePlain];
    tableview.tag = tag;
    tableview.delegate = delegate;
    tableview.dataSource = dataSource;
    tableview.tableFooterView = [[UIView alloc] init];
    tableview.tableHeaderView = [[UIView alloc] init];
    tableview.backgroundColor=[UIColor clearColor];
    tableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    [viewA addSubview:tableview];
    
    return tableview;
}

#pragma mark - UIScrollView
+ (UIScrollView *)scrrollViewWithRect:(CGRect)rect tag:(NSInteger)tag contentSize:(CGSize)contentSize view:(UIView *)viewA
{
    UIScrollView *scrrollView = [UIScrollView new];
    scrrollView.frame = rect;
    scrrollView.tag = tag;
    scrrollView.scrollEnabled = YES;
    scrrollView.contentSize = contentSize;
    scrrollView.backgroundColor = [UIColor clearColor];
    [viewA addSubview:scrrollView];
    
    return scrrollView;
}

#pragma mark - 16进制转color
+ (UIColor *)getColor:(NSString *)hexColor
{
    unsigned int red, green, blue;
    NSRange range;
    range.length = 2 ;
    range.location = 0 ;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
    range. location = 2 ;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
    range.location = 4 ;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green/255.0f) blue:(float)(blue/255.0f)alpha:1.0f];
}

#pragma mark - 计算文字高度
+ (CGSize)stringWithText:(NSString *)string font:(NSInteger)font with:(CGFloat)with
{
    NSAttributedString *attributedText =
    [[NSAttributedString alloc] initWithString:string
                                    attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]}];
    CGRect rect = [attributedText boundingRectWithSize:(CGSize){with, CGFLOAT_MAX}
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                               context:nil];
    return rect.size;
}

#pragma mark - 计算文字宽度
+ (CGSize)stringWithText:(NSString *)string font:(NSInteger)font heigh:(CGFloat)heigh
{
    NSAttributedString *attributedText =
    [[NSAttributedString alloc] initWithString:string
                                    attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]}];
    CGRect rect = [attributedText boundingRectWithSize:(CGSize){CGFLOAT_MAX, heigh}
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                               context:nil];
    return rect.size;
}

#pragma mark - 判断对象是否为空
+ (NSString *)trimStringAllBlank:(NSString *)oldString
{
    NSString * newString = [oldString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    newString = [newString stringByReplacingOccurrencesOfString:@" " withString:@""];
    return newString;
}

+ (BOOL)isEmpty:(id)obj
{
    if(obj == nil)
    {
        return YES;
    }
    else if([obj isKindOfClass:[NSString class]])
    {
        NSString *objStr = (NSString *)obj;
        if ([objStr isEqual:@""] || [[self trimStringAllBlank:objStr] isEqual:@"0"])
        {
            return YES;
        }
        if(objStr.length == 0)
        {
            return YES;
        }
    }
    else if([obj isKindOfClass:[NSNumber class]])
    {
        NSNumber *objNum = (NSNumber *)obj;
        if([objNum intValue] == 0)
        {
            return YES;
        }
    }
    else if([obj isKindOfClass:[NSNull class]])
    {
        return YES;
    }
    else
    {
    }
    return NO;
}

#pragma mark - 比较2个日期的大小
+ (BOOL)JudgeTwoDate:(NSString *)firstDate secondDate:(NSString *)secondDate{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *date1 = [dateFormatter dateFromString:firstDate];
    NSDate *date2 = [dateFormatter dateFromString:secondDate];
    
    NSComparisonResult result = [date1 compare:date2];
    
    //secondDate比firstDate早(小)
    if(result == 1){
        return NO;
    }
    //secondDate比firstDate晚(大)
    else{
        return YES;
    }
}

#pragma mark - 比较2个时间的大小
+ (BOOL)JudgeTwoTime:(NSString *)firstDate secondDate:(NSString *)secondDate{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    
    NSDate *date1 = [dateFormatter dateFromString:firstDate];
    NSDate *date2 = [dateFormatter dateFromString:secondDate];
    
    NSComparisonResult result = [date1 compare:date2];
    
    //secondDate比firstDate早(小)
    if(result == 1){
        return NO;
    }
    //secondDate比firstDate晚(大)
    else{
        return YES;
    }
}

#pragma mark - 获取现在日期
+ (NSString*)getNowDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *date = [dateFormatter stringFromDate:[NSDate date]];
    return date;
}

#pragma marl - 获取现在时间
+ (NSString*)getNowTime
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *date = [dateFormatter stringFromDate:[NSDate date]];
    return date;
}

#pragma mark - 获取当前时间戳
+ (NSString *)getNowTimeStamp
{
    NSDate *datenow = [NSDate date];
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
    
    return timeSp;
}

#pragma mark - 判断字符串是否是纯数字
+ (BOOL)isPureNumber:(NSString *)numStr
{
    if(![self isPureInt:numStr] || ![self isPureFloat:numStr])
    {
        return NO;
    }
    return YES;
}

#pragma mark - 判断字符串是否为整形
+ (BOOL)isPureInt:(NSString *)string
{
    NSScanner *scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

#pragma mark - 判断字符串是否为浮点型
+ (BOOL)isPureFloat:(NSString *)string
{
    NSScanner *scan = [NSScanner scannerWithString:string];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}

#pragma mark - 手机号正则
+ (BOOL)validateMobile:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,183,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString *MOBILE = @"^1(3[0-9]|5[0-35-9]|8[01235-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString *CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString *CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString *CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    //虚拟运行商号段
    NSString *VT=@"^17\\d{9}";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestvt=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",VT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES)
        ||([regextestvt evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

#pragma mark - 查看应用程序版本
+ (NSString *)getVersion
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return version;
}

#pragma mark - 查看手机系统版本
+ (NSString *)getSystemVersion
{
    return [[UIDevice currentDevice] systemVersion];
}

#pragma mark - 1.0.4
#pragma marl - UIImageView
+ (UIImageView *)imageViewWithImage:(NSString *)image rect:(CGRect)rect tag:(int)tag viewA:(UIView *)viewA
{
    if ([image isEqualToString:@""]) {
        image = @"为了防止控制台出现垃圾提示，在这做判断";
    }
    UIImageView *imgv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:image]];
    imgv.frame = rect;
    imgv.tag = tag;
    [viewA addSubview:imgv];
    
    return imgv;
}

@end
