//
//  UITableView+MJRefresh.m
//  BookBrowser
//
//  Created by Hanson on 16/4/13.
//  Copyright © 2016年 hanson. All rights reserved.
//

#import "UITableView+MJRefresh.h"

@implementation UITableView (MJRefresh)

-(void)headerAddMJRefresh:(MJRefreshComponentRefreshingBlock)block {
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:block];
}

-(void)headerBeginRefresh {
    [self.mj_header beginRefreshing];
}

-(void)headerEndRefresh {
    [self.mj_header endRefreshing];
}

-(void)footerAddMJRefresh:(MJRefreshComponentRefreshingBlock)block {
    self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:block];
}

-(void)footerBeginRefresh {
    [self.mj_footer beginRefreshing];
}

-(void)footerEndRefresh {
    [self.mj_footer endRefreshing];
}

-(void)footerEndRefreshNoMoreData {
    [self.mj_footer endRefreshingWithNoMoreData];
}

-(void)footerResetNoMoreData {
    [self.mj_footer resetNoMoreData];
}

@end
