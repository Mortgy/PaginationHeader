//
//  PaginatorTitleCollectionViewCell.h
//  PaginationHeaderView
//
//  Created by mortgy on 13.08.2018.
//  Copyright © 2018 Mortgy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PaginatorTitleCollectionViewCell;

@protocol PaginatorTitleCollectionViewCellDelegate

- (void)didSelectTitleCell:(PaginatorTitleCollectionViewCell *)cell;

@end

@interface PaginatorTitleCollectionViewCell : UICollectionViewCell

@property (nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic) UIColor *titleSelectedColor;
@property (nonatomic) IBOutlet UIButton *titleActionButton;
@property (nonatomic) id <PaginatorTitleCollectionViewCellDelegate> delegate;

- (void)selectCellItem;
- (void)deselectCellItem;

@end

