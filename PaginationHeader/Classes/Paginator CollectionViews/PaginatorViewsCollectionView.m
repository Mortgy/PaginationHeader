//
//  PaginatorViewsCollectionView.m
//  PaginationHeaderView
//
//  Created by mortgy on 13.08.2018.
//  Copyright © 2018 Mortgy. All rights reserved.
//

#import "PaginatorViewsCollectionView.h"
#import "PaginatorViewsHorizontalViewFlowLayout.h"
#import "PaginatorViewCollectionViewCell.h"

@implementation PaginatorViewsCollectionView

- (void)setViews:(NSArray<UIView *> *)views {
	_views = views;
	
	self.delegate = self;
	self.dataSource = self;
	
	self.pagingEnabled = YES;
	self.bounces = NO;
	
	NSBundle *classBundle = [NSBundle bundleForClass:[PaginatorViewCollectionViewCell class]];
	
	for (int i = 0; i < views.count; i++) {
		
		[self registerNib:[UINib nibWithNibName:@"PaginatorViewCollectionViewCell" bundle:classBundle] forCellWithReuseIdentifier:[NSString stringWithFormat:@"PaginatorViewCell_%@", @(i).stringValue]];
	}
	
	PaginatorViewsHorizontalViewFlowLayout * layout = [[PaginatorViewsHorizontalViewFlowLayout alloc] init];
	layout.itemSize = self.frame.size;
	self.collectionViewLayout = layout;
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pageTitleGotSelected:) name:@"PaginatorTitleGotSelected" object:nil];

}

- (void)pageTitleGotSelected:(NSNotification *)notification {
	NSNumber *pageNumber = notification.object;
	[self scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:pageNumber.integerValue inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return self.views.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	
	PaginatorViewCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:[NSString stringWithFormat:@"PaginatorViewCell_%@", @(indexPath.row).stringValue] forIndexPath:indexPath];
	UIView *view = self.views[indexPath.row];
//	view.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
	[cell.contentView addSubview:view];
	
	[self layoutCollectionViewCellSubview:view intoContainerView:cell.contentView];
	return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
	NSNumber *currentPage = @(scrollView.contentOffset.x / scrollView.frame.size.width);
	[[NSNotificationCenter defaultCenter] postNotificationName:@"PaginatorViewDidScrollToPage" object:currentPage];
}

- (void)layoutCollectionViewCellSubview:(UIView *)subView intoContainerView:(UIView *)containerView {
	
	subView.translatesAutoresizingMaskIntoConstraints = NO;
	
	//Top
	NSLayoutConstraint *top =[NSLayoutConstraint
							  constraintWithItem:subView
							  attribute:NSLayoutAttributeTop
							  relatedBy:NSLayoutRelationEqual
							  toItem:containerView
							  attribute:NSLayoutAttributeTop
							  multiplier:1.0f
							  constant:0.f];
	
	//Bottom
	NSLayoutConstraint *bottom =[NSLayoutConstraint
								 constraintWithItem:subView
								 attribute:NSLayoutAttributeBottom
								 relatedBy:NSLayoutRelationEqual
								 toItem:containerView
								 attribute:NSLayoutAttributeBottom
								 multiplier:1.0f
								 constant:0.f];
	
	//Trailing
	NSLayoutConstraint *trailing =[NSLayoutConstraint
								   constraintWithItem:subView
								   attribute:NSLayoutAttributeTrailing
								   relatedBy:NSLayoutRelationEqual
								   toItem:containerView
								   attribute:NSLayoutAttributeTrailing
								   multiplier:1.0f
								   constant:0.f];
	
	//Leading
	NSLayoutConstraint *leading = [NSLayoutConstraint
								   constraintWithItem:subView
								   attribute:NSLayoutAttributeLeading
								   relatedBy:NSLayoutRelationEqual
								   toItem:containerView
								   attribute:NSLayoutAttributeLeading
								   multiplier:1.0f
								   constant:0.f];
	
	
	//Add constraints to the Parent
	[containerView addConstraint:top];
	[containerView addConstraint:bottom];
	[containerView addConstraint:trailing];
	[containerView addConstraint:leading];

}

@end
