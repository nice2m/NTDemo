//
//  CustomTransitionViewController.m
//  NTDemo
//
//  Created by   on 9/27/19.
//  Copyright © 2019  . All rights reserved.
//

#import "CustomTransitionViewController.h"

@interface CustomTransitionViewController ()

@end

@implementation CustomTransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
    
    UILabel * lbl = [UILabel new];
    lbl.textAlignment = NSTextAlignmentCenter;
    lbl.textColor = [UIColor redColor];
    lbl.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
    lbl.text = @"天下武功，为快不破";
    
    lbl.frame = CGRectMake(0, 64, 200, 64);
    [self.view addSubview:lbl];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
