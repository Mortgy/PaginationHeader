//
//  PageItem.h
//  PaginationHeaderView
//
//  Created by mortgy on 13.08.2018.
//  Copyright © 2018 Mortgy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol PageItem
@end

@interface PageItem : NSObject

@property (nonatomic) NSString * indicatorTitle;
@property (nonatomic) UIView * pageView;

@end
