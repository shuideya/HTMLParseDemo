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
    NSString *htmlstr1 = [self handleHtmlTwo:htmlstring];
//    NSString *htmlstr2 = [self.webView stringByEvaluatingJavaScriptFromString:htmlstr1];
    [self.webView loadHTMLString:htmlstr1 baseURL:nil];
    
    
//    2.2
//    NSURL* url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"PageOne" ofType:@"html"]];
//    [self.webView loadRequest:request];
    
    
    
}

/*
 *  OC对转义字符的表示方法
 \a - Sound alert
 \b - 退格
 \f - Form feed
 \n - 换行
 \r - 回车
 \t - 水平制表符
 \v - 垂直制表符
 \\ - 反斜杠
 \" - 双引号
 \' - 单引号
 
 frome:http://dditblog.com/itshare_558.html
 */
//去掉反斜杠
- (NSString *)handleHtmlTwo:(NSString *)htmlstr{
    
    NSMutableString *responseString = [NSMutableString stringWithString:htmlstr];
    NSString *character = nil;
    for (int i = 0; i < responseString.length; i ++) {
        character = [responseString substringWithRange:NSMakeRange(i, 1)];
        if ([character isEqualToString:@"\\"])
            [responseString deleteCharactersInRange:NSMakeRange(i, 1)];
    }
    
    
    return responseString;
    
}

//并不好使
- (NSString *)handleHtmlOne:(NSString *)htmlstr{
    
    NSString *string = [NSString stringWithFormat:@"(\"%@\").toString().replace(/</g, \"<\").replace(/>/g, \">\").replace(/'/g, \"'\").replace(/ /g, \" \").replace(/&/g, \"&\");",htmlstr];
    
    string = [htmlstr stringByReplacingOccurrencesOfString:@"\\n" withString:@""];
    
    string = [htmlstr stringByReplacingOccurrencesOfString:@"" withString:@""];
    
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
