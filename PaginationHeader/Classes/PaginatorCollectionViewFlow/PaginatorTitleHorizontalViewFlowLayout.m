//
//  PaginatorHorizontalViewFlowLayout.m
//  PaginationHeaderView
//
//  Created by mortgy on 13.08.2018.
//  Copyright © 2018 Mortgy. All rights reserved.
//

#import "PaginatorTitleHorizontalViewFlowLayout.h"


@implementation PaginatorTitleHorizontalViewFlowLayout
@dynamic itemSize;


- (void)prepareLayout {
	[super prepareLayout];
	[self invalidateLayout];
	self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
	self.sectionInset = UIEdgeInsetsMake(0, 0, self.indicatorHeight, 0);
	[self setMinimumLineSpacing:0.f];
	
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
	return 0.f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
	return 0.f;
}

// Layout: Set Edges
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
	return UIEdgeInsetsMake(0, 0, self.indicatorHeight, 0);
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
	return self.itemSize;
}

@end
