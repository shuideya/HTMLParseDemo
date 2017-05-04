//
//  NormalHTMLViewController.m
//  HTMLParseDemo
//
//  Created by 杨帆 on 17/5/5.
//  Copyright © 2017年 yfan. All rights reserved.
//

#import "NormalHTMLViewController.h"

@interface NormalHTMLViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation NormalHTMLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    1.
//    加载一个网页url：
//    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];//创建URL
//    NSURLRequest* request = [NSURLRequest requestWithURL:url];//创建
//    [self.webView loadRequest:request];//加载
    

//    加载一个本地资源：
//    2.1
    NSURL* url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"PageOne" ofType:@"html"]];
    NSString * htmlstring = [[NSString alloc]initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
//    NSString *htmlstr1 = [self handleHtmlOne:htmlstring];
//    NSString *htmlstr2 = [self.webView stringByEvaluatingJavaScriptFromString:htmlstr1];
    [self.webView loadHTMLString:htmlstring baseURL:nil];
    
    
//    2.2
//    NSURL* url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"PageOne" ofType:@"html"]];
//    [self.webView loadRequest:request];
    
    
    
    
    //有些情况下 由于字符串里面含有双引号(") 和 同时多个换行符(\n\n),需要做替换处理，否则会导致效果出不来
    
}

- (NSString *)handleHtmlOne:(NSString *)htmlstr{
    
    NSString *string = [NSString stringWithFormat:@"(\"%@\").toString().replace(/</g, \"<\").replace(/>/g, \">\").replace(/'/g, \"'\").replace(/ /g, \" \").replace(/&/g, \"&\");",htmlstr];
    
    string = [htmlstr stringByReplacingOccurrencesOfString:@"\\n" withString:@""];
    
    string = [string stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    
    return string;
    
}
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
