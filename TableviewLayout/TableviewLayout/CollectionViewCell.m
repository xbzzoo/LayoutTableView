//
//  CollectionViewCell.m
//  TableviewLayout
//
//  Created by yang.sun on 2019/5/30.
//  Copyright © 2019年 yang.sun. All rights reserved.
//

#import "CollectionViewCell.h"
#import <Masonry.h>
@interface CollectionViewCell ()


@end

@implementation CollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        _titleLbl = [[UILabel alloc]init];
        _titleLbl.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLbl];
        [_titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(@0);
        }];
    }
    return self;
}
@end
