# DOPDropDownMenu-Enhanced

**New Update:**<br>
support cell image 
新增cell 图片 支持, 新增 detailText  

DOPDropDownMenu 添加双列表 优化版 （double tableView, The optimization version ）

首先 感谢 DOPDropDownMenu 作者的无私奉献和允许,  https://github.com/dopcn/DOPDropDownMenu 

我在此基础上美化来了界面，添加了双列表的应用，优化了代码，增强了稳定性，希望大家喜欢

First, I would like to thank the author of the [DOPDropDownMenu](https://github.com/dopcn/DOPDropDownMenu) for their selfless dedication.

This enhanced version includes beautiful improvements to the interface, double tableview capability, optimized code, and improved stability.  Enjoy!

### 应用截图
![image](https://raw.githubusercontent.com/12207480/DOPDropDownMenu-Enhanced/master/screenshot/dopmenu.png)
![image](https://raw.githubusercontent.com/12207480/DOPDropDownMenu-Enhanced/master/screenshot/dopmendemo.gif)

### 用法

```objc
#pragma mark - data source protocol
@class DOPDropDownMenu;

@protocol DOPDropDownMenuDataSource <NSObject>

@required

/**
 *  返回 menu 第column列有多少行
 */
- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column;

/**
 *  返回 menu 第column列 每行title
 */
- (NSString *)menu:(DOPDropDownMenu *)menu titleForRowAtIndexPath:(DOPIndexPath *)indexPath;

@optional
/**
 *  返回 menu 有多少列 ，默认1列
 */
- (NSInteger)numberOfColumnsInMenu:(DOPDropDownMenu *)menu;

// 新增  返回 menu 第column列 每行image
- (NSString *)menu:(DOPDropDownMenu *)menu imageNameForRowAtIndexPath:(DOPIndexPath *)indexPath;

// 新增 detailText ,right text
- (NSString *)menu:(DOPDropDownMenu *)menu detailTextForRowAtIndexPath:(DOPIndexPath *)indexPath;

/** 新增
 *  当有column列 row 行 返回有多少个item ，如果>0，说明有二级列表 ，=0 没有二级列表
 *  如果都没有可以不实现该协议
 */
- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfItemsInRow:(NSInteger)row column:(NSInteger)column;

/** 新增
 *  当有column列 row 行 item项 title
 *  如果都没有可以不实现该协议
 */
- (NSString *)menu:(DOPDropDownMenu *)menu titleForItemsInRowAtIndexPath:(DOPIndexPath *)indexPath;

// 新增 当有column列 row 行 item项 image
- (NSString *)menu:(DOPDropDownMenu *)menu imageNameForItemsInRowAtIndexPath:(DOPIndexPath *)indexPath;

// 新增
- (NSString *)menu:(DOPDropDownMenu *)menu detailTextForItemsInRowAtIndexPath:(DOPIndexPath *)indexPath;

@end

#pragma mark - delegate
@protocol DOPDropDownMenuDelegate <NSObject>
@optional
/**
 *  点击代理，点击了第column 第row 或者item项，如果 item >=0
 */
- (void)menu:(DOPDropDownMenu *)menu didSelectRowAtIndexPath:(DOPIndexPath *)indexPath;
@end
```
