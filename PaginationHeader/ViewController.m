//
//  ViewController.m
//  PaginationHeaderView
//
//  Created by mortgy on 13.08.2018.
//  Copyright © 2018 Mortgy. All rights reserved.
//

#import "ViewController.h"
#import "Paginator.h"
#import "SampleContentView.h"

@interface ViewController ()

@property (nonatomic) Paginator *paginator;
@property (nonatomic) IBOutlet PaginatorTitlesCollectionView *paginatorTitlesCollectionView;
@property (nonatomic) IBOutlet PaginatorViewsCollectionView *paginatorViewsCollectionView;


@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.paginator = [[Paginator alloc] init];
	self.paginator.titlesCollectionView = self.paginatorTitlesCollectionView;
	self.paginator.viewsCollectionView = self.paginatorViewsCollectionView;
	
	NSMutableArray *pages = [[NSMutableArray alloc] init];
	for (int i = 1; i < 5; i++) {
		
		NSString *pageTitle = [NSString stringWithFormat:@"Page %@", @(i).stringValue];
		
		PageItem *page = [[PageItem alloc] init];
		
		page.indicatorTitle = pageTitle;
		SampleContentView *view = [[NSBundle mainBundle] loadNibNamed:@"SampleContentView" owner:self options:nil][0];
		
		view.sampleTextLabel.text = pageTitle;
		page.pageView = view;
		
		[pages addObject:page];
		
	}
	
	self.paginator.pages = [pages copy];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
