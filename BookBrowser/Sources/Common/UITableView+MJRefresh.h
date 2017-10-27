//
//  UITableView+MJRefresh.h
//  BookBrowser
//
//  Created by Hanson on 16/4/13.
//  Copyright © 2016年 hanson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh/MJRefresh.h"

@interface UITableView (MJRefresh)

//添加顶部刷新
-(void)headerAddMJRefresh:(MJRefreshComponentRefreshingBlock)block ;

//手动顶部刷新
-(void)headerBeginRefresh;

//取消顶部刷新状态
-(void)headerEndRefresh;

//添加底部刷新
-(void)footerAddMJRefresh:(MJRefreshComponentRefreshingBlock)block;

//手动底部刷新
-(void)footerBeginRefresh;

//取消底部刷新状态
-(void)footerEndRefresh;

//取消底部刷新状态并显示无数据
-(void)footerEndRefreshNoMoreData;

//重置无数据状态
-(void)footerResetNoMoreData;

@end







