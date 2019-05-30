//
//  TableViewCell.m
//  TableviewLayout
//
//  Created by yang.sun on 2019/5/30.
//  Copyright © 2019年 yang.sun. All rights reserved.
//

#import "TableViewCell.h"
#import <Masonry.h>
#import "CollectionViewCell.h"
@interface TableViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong)UICollectionView *collectView;

@end
@implementation TableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style
                reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.collectView];
        //设置子视图与父视图的约束，以便b子视图变化是能“撑”起父视图
        [self.collectView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.left.top.equalTo(@0);
             make.height.mas_equalTo(@1).priorityLow();//设置一个高度，以便赋值后更新
        }];
        
    }
    return self;
}

-(void)setDataModel:(NSDictionary *)dataModel{
    _dataModel = dataModel;
    
    [self.collectView reloadData];
    [self.collectView layoutIfNeeded];
    
    /*
     collectionView加载完毕后执行更新Layout
     **/
    
    //获取collectionview高度
    CGFloat height = self.collectView.collectionViewLayout.collectionViewContentSize.height;
    NSLog(@"height = %lf",height);
    
    //更新collectionView
    [self.collectView mas_updateConstraints:^(MASConstraintMaker *make) {
         make.height.mas_equalTo(@(height)).priorityLow();
        
    }];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSArray *tagsArr = self.dataModel[@"tags"];
    return tagsArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    NSArray *tagsArr = self.dataModel[@"tags"];
    
    cell.titleLbl.text = tagsArr[indexPath.row];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *tagsArr = self.dataModel[@"tags"];
    
    return [self getTextWidth:tagsArr[indexPath.row]];
}

-(CGSize)getTextWidth:(NSString *)text{
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:14]};
    CGSize currentLabelSize = [text sizeWithAttributes:attribute];
    CGFloat cellWidth = MAX(50, currentLabelSize.width + 16);
    return CGSizeMake(cellWidth, 35);
}

-(UICollectionView *)collectView{
    if (!_collectView) {
        
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        layout.sectionInset = UIEdgeInsetsMake(5, 10, 5, 10);
        layout.minimumLineSpacing = 5;
        layout.minimumInteritemSpacing = 5;
        _collectView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectView.backgroundColor = [UIColor whiteColor];
        _collectView.delegate=self;
        _collectView.dataSource=self;
        [_collectView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
        
    }
    return _collectView;
}


@end
