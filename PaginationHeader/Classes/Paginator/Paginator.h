//
//  Paginator.h
//  PaginationHeaderView
//
//  Created by mortgy on 13.08.2018.
//  Copyright © 2018 Mortgy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PageItem.h"
#import "PaginatorTitlesCollectionView.h"
#import "PaginatorViewsCollectionView.h"

@interface Paginator : NSObject

@property (nonatomic) PaginatorTitlesCollectionView * titlesCollectionView;
@property (nonatomic) PaginatorViewsCollectionView * viewsCollectionView;
@property (nonatomic) float indicatorHeight;
@property (nonatomic) UIColor * titlesIndicatorColor;

@property (nonatomic) NSArray <PageItem> *pages;


@end
