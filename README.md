# LayoutTableView
Tableview嵌套CollectionView 高度自适应

![图](https://github.com/Sunyangl/LayoutTableView/blob/master/1559214980324.jpg)


敲黑板：

1、masonry子视图可以更新父视图，通过设置边界约束
2、获取collectionView加载完的操作：

[self.collectionview layoutIfNeed];
//加需要操作的内容

3、tableView的子更新
