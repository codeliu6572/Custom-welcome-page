//
//  ViewController.m
//  自定义欢迎页和显示时间
//
//  Created by 刘浩浩 on 15/12/23.
//  Copyright © 2015年 刘浩浩. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"
#import "AppDelegate.h"
@interface ViewController ()
{
    int _i;
    NSTimer *timer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:self.view.frame];
    UIImage *image=[UIImage imageNamed:@"Default-568h@2x.png"];
    imageView.image=image;
    [self.view addSubview:imageView];
  
    //此处定时器只是为了起到一个触发事件，可换成其他的方法来触发，比如说下载完成什么的，此书直接加菊花，出发后删除即可。（触发事件，或者下载广告，下载zip文件等等操作都写在这里，这里就是欢迎页，成功后转换root即可）
    timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];

}
#pragma mark - timerAction
-(void)timerAction
{
    _i++;
    if (_i==3) {
        //这里可加动画，根据自己需要来写
        ViewController1 *view1VC=[[ViewController1 alloc]init];
//        UINavigationController *nav1=[[UINavigationController alloc]initWithRootViewController:view1VC];
        AppDelegate *appdelegate=[UIApplication sharedApplication].delegate;
        appdelegate.window.rootViewController=view1VC;
        [timer invalidate];
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
