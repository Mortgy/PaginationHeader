//
//  PaginatorTitlesCollectionView.m
//  PaginationHeaderView
//
//  Created by mortgy on 13.08.2018.
//  Copyright © 2018 Mortgy. All rights reserved.
//

#import "PaginatorTitlesCollectionView.h"
#import "PaginatorTitleHorizontalViewFlowLayout.h"
#import "PaginatorTitleCollectionViewCell.h"

@interface PaginatorTitlesCollectionView () <PaginatorTitleCollectionViewCellDelegate>

@property (nonatomic) UIView *indicatorView;
@property (nonatomic) float itemWidth;;
@property (nonatomic) NSInteger selectedCellIndex;
@end

@implementation PaginatorTitlesCollectionView
{
	PaginatorTitleHorizontalViewFlowLayout * layout;
}

- (void)awakeFromNib {
	[super awakeFromNib];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pageViewDidScroll:) name:@"PaginatorViewDidScrollToPage" object:nil];
	[self addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionOld context:NULL];
}

- (void)pageViewDidScroll:(NSNotification *)notification {
	NSNumber *pageNumber = notification.object;
	if (pageNumber.integerValue != self.selectedCellIndex) {
		[self collectionView:self didSelectItemAtIndexPath:[NSIndexPath indexPathForRow:pageNumber.integerValue inSection:0]];
	}
}

- (void)setTitles:(NSArray<NSString *> *)titles {
	_titles = titles;
	
	self.selectedCellIndex = 0;
	
	self.delegate = self;
	self.dataSource = self;
	self.scrollEnabled = NO;
	self.bounces = NO;
	
	
	NSBundle *classBundle = [NSBundle bundleForClass:[PaginatorTitleCollectionViewCell class]];
	[self registerNib:[UINib nibWithNibName:@"PaginatorTitleCollectionViewCell" bundle:classBundle] forCellWithReuseIdentifier:@"PaginatorTitleCell"];
	
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary  *)change context:(void *)context
{
	// You will get here when the reloadData finished
	if (!layout) {
		
		//Check for indicator Height
		if (self.indicatorHeight == 0.f) {
			self.indicatorHeight = 2.0f;
		}
		//Calculate Item Width
		self.itemWidth = (self.frame.size.width / [self.titles count]);
		
		//Setup Indicator
		self.indicatorView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - self.indicatorHeight, self.itemWidth, self.indicatorHeight)];
		if (!self.titlesIndicatorColor) {
			self.titlesIndicatorColor = [UIColor colorWithRed:0 green:(156.f/255.f) blue:(250.f/255.f) alpha:1.f];
		}
		self.indicatorView.backgroundColor = self.titlesIndicatorColor;
		[self addSubview:self.indicatorView];
		
		layout = [[PaginatorTitleHorizontalViewFlowLayout alloc] init];
		
		layout.itemSize = CGSizeMake(self.itemWidth, self.frame.size.height-self.indicatorHeight);
		layout.indicatorHeight = self.indicatorHeight;
		self.collectionViewLayout = layout;
		[self removeObserver:self forKeyPath:@"contentSize" context:NULL];
		
	}
	
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return self.titles.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	
	PaginatorTitleCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PaginatorTitleCell" forIndexPath:indexPath];
	
	if (self.titleFont) {
		cell.titleLabel.font = self.titleFont;
	}
	
	cell.titleLabel.text = [self.titles objectAtIndex:indexPath.row];
	cell.titleSelectedColor = self.titlesIndicatorColor;
	cell.delegate = self;
	
	if (indexPath.row == self.selectedCellIndex) {
		[cell selectCellItem];
	} else {
		[cell deselectCellItem];
	}
	
	return cell;
}

- (void)didSelectTitleCell:(PaginatorTitleCollectionViewCell *)cell {
	[self collectionView:self didSelectItemAtIndexPath:[self indexPathForCell:cell]];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
	PaginatorTitleCollectionViewCell * cell = (PaginatorTitleCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
	[UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
		
		CGRect indicatorFrame = self.indicatorView.frame;
		indicatorFrame.origin.x = cell.frame.origin.x;
		self.indicatorView.frame = indicatorFrame;
		
		if (self.selectedCellIndex != indexPath.row) {
			[[NSNotificationCenter defaultCenter] postNotificationName:@"PaginatorTitleGotSelected" object:@(indexPath.row)];
		}
		
	} completion:^(BOOL finished) {
		self.selectedCellIndex = indexPath.row;
		[collectionView reloadData];
	}];
}

@end
