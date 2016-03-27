//
//  ViewController.m
//  AFNetWorking
//
//  Created by 王龙 on 16/3/27.
//  Copyright © 2016年 Larry（Lawrence）. All rights reserved.
//

#import "ViewController.h"
//1.导入框架
#import "AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor greenColor];

    //    2.初始化对象
    //    注意用shareManger来初始化对象
    AFNetworkReachabilityManager *reachabilityManger = [AFNetworkReachabilityManager sharedManager];
    
    //    3.开始监测
    [reachabilityManger startMonitoring];
    
    //    4.获得网络状态
    [reachabilityManger setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSString *statue;
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:{
                statue = @"未知的网络";
                break;
            }
            case AFNetworkReachabilityStatusNotReachable:{
                statue = @"无网络";
                break;
            }
                
            case AFNetworkReachabilityStatusReachableViaWWAN:{
                statue = @"蜂窝网络";
                break;
            }
                
            case AFNetworkReachabilityStatusReachableViaWiFi:{
                statue = @"WIFI的网络";
                break;
            }
                
            default:
                break;
        }
//        输出网络环境判断的结果
        NSLog(@"%@",statue);
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
