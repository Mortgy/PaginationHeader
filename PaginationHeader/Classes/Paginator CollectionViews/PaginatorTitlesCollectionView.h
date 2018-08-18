//
//  PaginatorTitlesCollectionView.h
//  PaginationHeaderView
//
//  Created by mortgy on 13.08.2018.
//  Copyright © 2018 Mortgy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaginatorTitlesCollectionView : UICollectionView <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic) NSArray <NSString *> * titles;
@property (nonatomic) UIColor * titlesIndicatorColor;
@property (nonatomic) float indicatorHeight;
@property (nonatomic) UIFont * titleFont;

@end
