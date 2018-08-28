//
//  PaginatorTitleCollectionViewCell.m
//  PaginationHeaderView
//
//  Created by mortgy on 13.08.2018.
//  Copyright © 2018 Mortgy. All rights reserved.
//

#import "PaginatorTitleCollectionViewCell.h"

@interface PaginatorTitleCollectionViewCell()


@end

@implementation PaginatorTitleCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)selectCellItem {
	self.titleLabel.textColor = self.titleSelectedColor;
}

- (void)deselectCellItem {
	self.titleLabel.textColor = [UIColor blackColor];
}

- (IBAction)didSelectButton:(id)sender {
	[self.delegate didSelectTitleCell:self];
}

@end
