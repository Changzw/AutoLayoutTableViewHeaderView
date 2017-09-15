//
//  ErrorTabelViewController.m
//  AutoLayoutTableViewHeaderView
//
//  Created by Czw on 15/09/2017.
//  Copyright © 2017 Czw. All rights reserved.
//

#import "ErrorTabelViewController.h"
#import "FlexibleHeightView.h"

@interface ErrorTabelViewController ()<
UITableViewDelegate,
UITableViewDataSource>

@property (nonatomic, strong, readonly) UITableView *tableView;
@property (nonatomic, strong, readonly) FlexibleHeightView *headerView;
@end

@implementation ErrorTabelViewController

- (void)loadView{
  [super loadView];
  _tableView = [UITableView new];
  [self.view addSubview:self.tableView];
  [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(self.mas_topLayoutGuide);
    make.left.right.equalTo(self.view);
    make.bottom.equalTo(self.mas_bottomLayoutGuide);
  }];
  
  // you have to set real width for tableViewHeaderView.
  // systemLayoutSizeFittingSize method need the widht to caculate view size
#warning this demo, we don't set frame to headerView, so that systemLayoutSizeFittingSize can't caculate the correct size of headerView
  _headerView = [[FlexibleHeightView alloc] initWithFrame:CGRectZero];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self.headerView setNeedsLayout];
  [self.headerView layoutIfNeeded];
  // error
  float height = [self.headerView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
  CGRect frame = self.headerView.frame;
  frame.size.height = height;
  self.headerView.frame = frame;
  self.tableView.tableHeaderView = self.headerView;
}

#pragma mark- tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{ return 0; }
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{ return 0; }
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{ return nil; }
@end
