//
//  Paginator.m
//  PaginationHeaderView
//
//  Created by mortgy on 13.08.2018.
//  Copyright © 2018 Mortgy. All rights reserved.
//

#import "Paginator.h"

@implementation Paginator

- (void)setPages:(NSArray<PageItem> *)pages {
	_pages = pages;
	self.titlesCollectionView.titles = [pages valueForKey:@"indicatorTitle"];
	self.viewsCollectionView.views = [pages valueForKey:@"pageView"];
	[self.titlesCollectionView reloadData];
	[self.viewsCollectionView reloadData];
}

@end
