//
//  HKCommonToo.m
//  Takeaway
//
//  Created by hank on 2020/8/19.
//  Copyright © 2020 LZQ. All rights reserved.
//

#import "HKCommonTool.h"

@implementation HKCommonTool


+ (id)getVCWithClassWtihClassName:(Class)targetClass targetResponderView:(UIResponder *)targetResponder{
    do{
        if([targetResponder isKindOfClass:targetClass]){
            return targetResponder;
        }
        targetResponder = [targetResponder nextResponder];
    }while (targetResponder!=nil);
    return nil;
}

+ (UIViewController *)getClassWtihClassName:(Class)aClass targetVC:(UIViewController *)target{
    NSArray *array=target.navigationController.viewControllers;
    for (UIViewController *vc in array){
        if([vc isKindOfClass:aClass]){
            return vc;
        }
    }
    return nil;
}



//color->image
+ (UIImage*) createImageWithColor:(UIColor*) color{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}



//打电话
+ (void)showWithTellPhone:(NSString *)Number inView:(UIView *)view{
    UIWebView *callWebview = [[UIWebView alloc] init];
    NSString *strPhone = [NSString stringWithFormat:@"tel:%@",Number];
    NSURL *telURL =[NSURL URLWithString:[strPhone stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [callWebview loadRequest:[NSURLRequest requestWithURL:telURL]];
    [view addSubview:callWebview];
}

//模态相关
+ (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion{
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewControllerToPresent];
    UIViewController *rootVc  = [ [[UIApplication sharedApplication].windows firstObject] rootViewController];
    while (rootVc.presentedViewController) {
        rootVc = rootVc.presentedViewController;
    }
    [rootVc presentViewController:nav animated:flag completion:completion];
}

+ (void)dismissViewControllerAnimated: (BOOL)flag completion: (void (^)(void))completion{
    UIViewController *rootVc = [ [[UIApplication sharedApplication].windows firstObject] rootViewController];
    while (rootVc.presentedViewController) {
        rootVc = rootVc.presentedViewController;
    }
    [rootVc dismissViewControllerAnimated:flag completion:completion];
}


//保存图片到沙盒
+ (NSString *)getImagePath:(UIImage *)Image filename:(NSString*)filaname{
    NSString *filePath = nil;
    NSData *data = [self imageData:Image];
    NSString *DocumentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    //文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //把刚刚图片转换的data对象拷贝至沙盒中
    [fileManager createDirectoryAtPath:DocumentsPath withIntermediateDirectories:YES attributes:nil error:nil];
    NSString *ImagePath = [[NSString alloc] initWithFormat:@"/%@",filaname];
    [fileManager createFileAtPath:[DocumentsPath stringByAppendingString:ImagePath] contents:data attributes:nil];
    //得到选择后沙盒中图片的完整路径
    filePath = [[NSString alloc] initWithFormat:@"%@%@", DocumentsPath, ImagePath];
    return filePath;
}

+ (NSData *)imageData:(UIImage *)myimage{
    NSData *data=UIImageJPEGRepresentation(myimage, 1.0);
    if (data.length>100*1024) {
        if (data.length>2*1024*1024) {//2M以及以上
            data=UIImageJPEGRepresentation(myimage, 0.08);
        }else if (data.length>1024*1024) {//1M-2M
            data=UIImageJPEGRepresentation(myimage, 0.2);
        }else if (data.length>512*1024) {//0.5M-1M
            data=UIImageJPEGRepresentation(myimage, 0.4);
        }else if (data.length>200*1024) {//0.25M-0.5M
            data=UIImageJPEGRepresentation(myimage, 0.8);
        }
    }
    return data;
}

+ (NSString *)getNoCompressImagePath:(UIImage *)Image filename:(NSString*)filaname{
    NSString *filePath = nil;
    NSData *data=UIImageJPEGRepresentation(Image, 1.0);
    NSString *DocumentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    //文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //把刚刚图片转换的data对象拷贝至沙盒中
    [fileManager createDirectoryAtPath:DocumentsPath withIntermediateDirectories:YES attributes:nil error:nil];
    NSString *ImagePath = [[NSString alloc] initWithFormat:@"/%@",filaname];
    [fileManager createFileAtPath:[DocumentsPath stringByAppendingString:ImagePath] contents:data attributes:nil];
    //得到选择后沙盒中图片的完整路径
    filePath = [[NSString alloc] initWithFormat:@"%@%@", DocumentsPath, ImagePath];
    return filePath;
}

@end
