//
//  NSObject+DEDAO.m
//  IPAPatch
//
//  Created by boob on 2017/6/7.
//  Copyright © 2017年 Weibo. All rights reserved.
//

#import "NSObject+DEDAO.h"

#import "NEHTTPEye.h"
#import "NEHTTPEyeViewController.h"
#import <WebKit/WebKit.h>
#import <KxMenu/KxMenu.h>
#if DEBUG
#import "FLEXManager.h"
#endif


static void __attribute__((constructor)) initialize(void) {
    NSLog(@"++++++++ dedao plugin loaded ++++++++");
    
    
    CBHookInstanceMethod(UIViewController, @selector(viewWillDisappear:), @selector(hbviewWillDisappear:));
    CBHookInstanceMethod(UIViewController, @selector(viewDidAppear:), @selector(hbviewDidAppear:));
    
    
}


@implementation NSObject(DEDAO)


-(void)hb__reloadTableView{
   
}

-(NSString *)adsentstr{
    NSString * str = @"<script async src=\"//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js\"></script>\
    <script>\
    (adsbygoogle = window.adsbygoogle || []).push({\
    google_ad_client: \"ca-pub-9328451355957403\",\
    enable_page_level_ads: true\
    });\
    </script>\
    \
    <script>\
    (function() {\
        var cx = 'partner-pub-9328451355957403:1362293227';\
        var gcse = document.createElement('script');\
        gcse.type = 'text/javascript';\
        gcse.async = true;\
        gcse.src = 'https://cse.google.com/cse.js?cx=' + cx;\
        var s = document.getElementsByTagName('script')[0];\
        s.parentNode.insertBefore(gcse, s);\
    })();\
    </script>\
    <gcse:search></gcse:search>";
    
    return str;
}


- (void)loadwebViewContent:(WKWebView *)webview{
    
  
}
-(void)savehtmltolocoal:(NSString *)htmlstr title:(NSString *)title{
    
//    NSRange  bodyrange = [htmlstr rangeOfString:@"<body>"];
    htmlstr = [htmlstr stringByReplacingOccurrencesOfString:@"<body>" withString:[NSString stringWithFormat:@"<body>%@",[self adsentstr]]];
    
    NSString *LoacalfilePath;
    title = [title stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    title = [title stringByReplacingOccurrencesOfString:@"/" withString:@"-"];
    NSString *fileName = [NSString stringWithFormat:@"%@.html",title];
    
    //    LoacalfilePath = [NSHomeDirectory() stringByAppendingPathComponent:fileName];
    // 获取Library目录
    NSString * parentpath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];;
    LoacalfilePath = [parentpath stringByAppendingPathComponent:fileName];
    
    [[NSFileManager defaultManager] createDirectoryAtPath: parentpath withIntermediateDirectories:YES attributes:nil error:NULL];
    NSData *imageData = [htmlstr dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    [imageData writeToFile:LoacalfilePath options:NSAtomicWrite error:&error];
    if (!error) {
        NSLog(@">>>>> html文件保存成功: %@",LoacalfilePath);
    }
    else{
        NSLog(@"xxxxxx html文件保存失败: %@",LoacalfilePath);
    }
    
 
}

//TODO: 获取订阅的
- (id)hb_changeHtmlFont:(id)arg1{
    NSLog(@"___%s___",__func__);
 
}

+ (id)getArticleEntityFromArticleInfoEntity:(id)arg1{
    NSLog(@"___%s___",__func__);
    id obj = [self getArticleEntityFromArticleInfoEntity:arg1];
    return obj;
}
+(id)hbparseArticleInfoEntityByJSON:(id)arg1{
    
    id obj = [self hbparseArticleInfoEntityByJSON:arg1];
    return obj;
}

- (id)hb__initWithJsonObject:(id)arg1{
    
    id obj = [self hb__initWithJsonObject:arg1];
    return obj;
}
- (id)hbencryptData:(id)arg1 withInfo:(id)arg2;
{
    return [self hbencryptData:arg1 withInfo:arg2];
}
-(NSString *)hbsign{
    return [self hbsign];
}

-(void)hbviewDidAppear:(bool)arg1{
    [self hbviewDidAppear:arg1];
    NSLog(@"\n\n ~~~ %@ viewDidAppear~~~ \n ",NSStringFromClass([self class]));
    if ([NSStringFromClass([self class]) isEqualToString:@"FreeColumnTextViewController"]) {
        //TODO:每天听本书
        WKWebView * webview = [self valueForKey:@"webView"];
        [self loadwebViewContent:webview];
    }
    else if ([NSStringFromClass([self class]) isEqualToString:@"ErechtheionArticleViewController"]) {
        //TODO: 课程
        WKWebView * webview = [self valueForKey:@"webView"];
        [self loadwebViewContent:webview];
    }
    else if ([NSStringFromClass([self class]) isEqualToString:@"SubscribeInfoWKViewController"]) {
        //TODO:订阅使用上面的方式👆
    }
    
}
-(void)hbviewWillDisappear:(bool)arg1{
    
    NSLog(@"\n\n ~~~ %@ hbviewWillDisappear ~~~ \n ",NSStringFromClass([self class]));
    [self hbviewWillDisappear:arg1];
}

- (id)hbgenerateJsonMessage:(id)arg1{
    
    NSLog(@"\njson:%@",arg1);
    return [self hbgenerateJsonMessage:arg1];
}

-(void)getallmethods{
    unsigned int methCount = 0;
    Method *meths = class_copyMethodList([self class], &methCount);
    
    NSLog(@"%@ allmethods: \n",NSStringFromClass(self.class));
    
    for(int i = 0; i < methCount; i++) {
        
        Method meth = meths[i];
        
        SEL sel = method_getName(meth);
        
        const char *name = sel_getName(sel);
        
        NSLog(@"%s \n", name);
    }
    free(meths);
}

@end
