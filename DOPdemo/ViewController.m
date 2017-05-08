//
//  ViewController.m
//  DOPdemo
//
//  Created by tanyang on 15/3/22.
//  Copyright (c) 2015年 tanyang. All rights reserved.
//

#import "ViewController.h"
#import "DOPDropDownMenu.h"

@interface ViewController ()<DOPDropDownMenuDataSource,DOPDropDownMenuDelegate>
@property (nonatomic, strong) NSArray *classifys;
@property (nonatomic, strong) NSArray *cates;
@property (nonatomic, strong) NSArray *movices;
@property (nonatomic, strong) NSArray *hostels;
@property (nonatomic, strong) NSArray *areas;

@property (nonatomic, strong) NSArray *sorts;
@property (nonatomic, weak) DOPDropDownMenu *menu;
@property (nonatomic, weak) DOPDropDownMenu *menuB;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"DOPDropDownMenu";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"重新加载" style:UIBarButtonItemStylePlain target:self action:@selector(menuReloadData)];
    // 数据
    self.classifys = @[@"美食",@"今日新单",@"电影",@"酒店"];
    self.cates = @[@"自助餐",@"快餐",@"火锅",@"日韩料理",@"西餐",@"烧烤小吃"];
    self.movices = @[@"内地剧",@"港台剧",@"英美剧"];
    self.hostels = @[@"经济酒店",@"商务酒店",@"连锁酒店",@"度假酒店",@"公寓酒店"];
    self.areas = @[@"全城",@"芙蓉区",@"雨花区",@"天心区",@"开福区",@"岳麓区"];
    self.sorts = @[@"默认排序",@"离我最近",@"好评优先",@"人气优先",@"最新发布"];
    
    // 添加下拉菜单
    DOPDropDownMenu *menu = [[DOPDropDownMenu alloc] initWithOrigin:CGPointMake(0, 64) andHeight:44];
    menu.delegate = self;
    menu.dataSource = self;
    [self.view addSubview:menu];
    _menu = menu;
    //当下拉菜单收回时的回调，用于网络请求新的数据
    _menu.finishedBlock=^(DOPIndexPath *indexPath){
        if (indexPath.item >= 0) {
            NSLog(@"收起:点击了 %ld - %ld - %ld 项目",indexPath.column,indexPath.row,indexPath.item);
        }else {
            NSLog(@"收起:点击了 %ld - %ld 项目",indexPath.column,indexPath.row);
        }
    };
//     创建menu 第一次显示 不会调用点击代理，可以用这个手动调用
//    [menu selectDefalutIndexPath];
    [menu selectIndexPath:[DOPIndexPath indexPathWithCol:0 row:0 item:0]];
}

- (void)menuReloadData
{
    self.classifys = @[@"美食",@"今日新单",@"电影"];
    [_menu reloadData];
}
- (IBAction)selectIndexPathAction:(id)sender {
    [_menu selectIndexPath:[DOPIndexPath indexPathWithCol:0 row:2 item:2]];
}

- (NSInteger)numberOfColumnsInMenu:(DOPDropDownMenu *)menu
{
    return 3;
}

- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column
{
    if (column == 0) {
        return self.classifys.count;
    }else if (column == 1){
        return self.areas.count;
    }else {
        return self.sorts.count;
    }
}

- (NSString *)menu:(DOPDropDownMenu *)menu titleForRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.column == 0) {
        return self.classifys[indexPath.row];
    } else if (indexPath.column == 1){
        return self.areas[indexPath.row];
    } else {
        return self.sorts[indexPath.row];
    }
}

// new datasource

- (NSString *)menu:(DOPDropDownMenu *)menu imageNameForRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.column == 0 || indexPath.column == 1) {
        return [NSString stringWithFormat:@"ic_filter_category_%ld",indexPath.row];
    }
    return nil;
}

- (NSString *)menu:(DOPDropDownMenu *)menu imageNameForItemsInRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.column == 0 && indexPath.item >= 0) {
        return [NSString stringWithFormat:@"ic_filter_category_%ld",indexPath.item];
    }
    return nil;
}

// new datasource

- (NSString *)menu:(DOPDropDownMenu *)menu detailTextForRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.column < 2) {
        return [@(arc4random()%1000) stringValue];
    }
    return nil;
}

- (NSString *)menu:(DOPDropDownMenu *)menu detailTextForItemsInRowAtIndexPath:(DOPIndexPath *)indexPath
{
    return [@(arc4random()%1000) stringValue];
}

- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfItemsInRow:(NSInteger)row column:(NSInteger)column
{
    if (column == 0) {
        if (row == 0) {
           return self.cates.count;
        } else if (row == 2){
            return self.movices.count;
        } else if (row == 3){
            return self.hostels.count;
        }
    }
    return 0;
}

- (NSString *)menu:(DOPDropDownMenu *)menu titleForItemsInRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.column == 0) {
        if (indexPath.row == 0) {
            return self.cates[indexPath.item];
        } else if (indexPath.row == 2){
            return self.movices[indexPath.item];
        } else if (indexPath.row == 3){
            return self.hostels[indexPath.item];
        }
    }
    return nil;
}

- (void)menu:(DOPDropDownMenu *)menu didSelectRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.item >= 0) {
         NSLog(@"点击了 %ld - %ld - %ld 项目",indexPath.column,indexPath.row,indexPath.item);
    }else {
         NSLog(@"点击了 %ld - %ld 项目",indexPath.column,indexPath.row);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
