//
//  BaseTableViewController.h
//  NTDemo
//
//  Created by   on 10/8/19.
//  Copyright © 2019  . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NTDemoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewController : UITableViewController
@property (nonatomic, strong)NSMutableArray<NTDemoModel *> * dataSource;

- (void)demoConfig;

@end

NS_ASSUME_NONNULL_END
