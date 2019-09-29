//
//  DemoController.m
//  NTDemo
//
//  Created by Ganjiuhui on 9/24/19.
//  Copyright © 2019 Ganjiuhui. All rights reserved.
//

#import "DemoController.h"

@interface DemoController ()

@end

@implementation DemoController


#pragma mark - interface

#pragma mark - life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
        // Do any additional setup after loading the view.
    [self configUI];
    
    [self config];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}



- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}


#pragma mark - private

- (void)configUI
{
    
}

- (void)config
{
    
}


#pragma mark - action


#pragma mark - delegate


#pragma mark - setter & getter



@end

//@interface <#class name#> ()
//
//@end
//
//@implementation <#class#> (<#category name#>)
//
//<#methods#>
//
//@end
