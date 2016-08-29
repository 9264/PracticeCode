//
//  ViewController.m
//  解析XML文件
//
//  Created by 9264 on 16/8/26.
//  Copyright © 2016年 LY9264. All rights reserved.
//

#import "ViewController.h"
#import "LYModel.h"

@interface ViewController ()<NSXMLParserDelegate>

@end

@implementation ViewController{
    
    NSMutableString *_stringM;
    LYModel *_modeL;
    NSMutableArray *_arrM;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _stringM = [NSMutableString string];
    _arrM = [NSMutableArray array];
    
    [self loadData];
}

- (void)loadData {
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/videos.xml"];
    
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
        
        
        
        if (error == nil && data != nil) {
            
            NSXMLParser *parser = [[NSXMLParser alloc]initWithData:data];
            parser.delegate = self;
            
            [parser parse];
        }else{
            NSLog(@"%@",error);
        }
    }]resume];
}

    /*
     开始
     */
- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    NSLog(@"开始");
}
    /*
     节点开始
     */
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    if ([elementName isEqualToString:@"video"]) {
        
        _modeL = [[LYModel alloc]init];
        
        [_arrM addObject:_modeL];
        _modeL.videoId = attributeDict[@"videoId"];
    }
    
    
    
}
    /*
     节点中的内容
     */
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    [_stringM appendString:string];
}
    /*
     节点结束
     */
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
 
    if (![elementName isEqualToString:@"video"] && ![elementName isEqualToString:@"videos"]) {
        [_modeL setValue:_stringM forKey:elementName];
    }
    
    [_stringM setString:@""];
}
    /*
     结束
     */
- (void)parserDidEndDocument:(NSXMLParser *)parser{
    
    NSLog(@"%@",_modeL);
    
}
    /*
     错误信息
     */
-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError{
    NSLog(@"出错%@",parseError);
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
