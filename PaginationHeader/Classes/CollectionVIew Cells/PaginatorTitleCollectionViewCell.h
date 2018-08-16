//
//  PaginatorTitleCollectionViewCell.h
//  PaginationHeaderView
//
//  Created by mortgy on 13.08.2018.
//  Copyright © 2018 Mortgy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaginatorTitleCollectionViewCell : UICollectionViewCell

@property (nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic) UIColor *titleSelectedColor;

- (void)selectCellItem;
- (void)deselectCellItem;

@end
