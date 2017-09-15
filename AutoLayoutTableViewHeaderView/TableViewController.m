//
//  TableViewController.m
//  AutoLayoutTableViewHeaderView
//
//  Created by Czw on 15/09/2017.
//  Copyright © 2017 Czw. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()<
UITableViewDelegate,
UITableViewDataSource>

@property (nonatomic, strong, readonly) UITableView *tableView;
@property (nonatomic, strong, readonly) FlexibleHeightView *headerView;
@end

@implementation TableViewController

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
  _headerView = [[FlexibleHeightView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), 1000)];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  // !!! for caculate size
  [self.headerView setNeedsLayout];
  [self.headerView layoutIfNeeded];

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
