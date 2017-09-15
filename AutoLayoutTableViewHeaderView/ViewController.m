//
//  ViewController.m
//  AutoLayoutTableViewHeaderView
//
//  Created by Czw on 15/09/2017.
//  Copyright © 2017 Czw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong, readonly) FlexibleHeightView *headerView;
@end

@implementation ViewController

- (void)loadView{
  [super loadView];
  
  // we don't need set frame to flexibaleHeightView, it is caculated by autoLayout system
  _headerView = [FlexibleHeightView new];
  [self.view addSubview:self.headerView];
  
  [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.right.equalTo(self.view);
    make.top.equalTo(self.mas_topLayoutGuide);
  }];
}

- (void)viewDidLoad {
  [super viewDidLoad];
}

@end
