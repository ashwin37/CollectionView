//
//  RecipeHeaderView.h
//  CollectionView
//
//  Created by Ashwin Tallapaka on 1/2/17.
//  Copyright © 2017 Ashwin Tallapaka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeHeaderView : UICollectionReusableView
@property (weak, nonatomic) IBOutlet UIImageView *recipeHeaderImg;

@property (weak, nonatomic) IBOutlet UILabel *recipeHeaderLbl;
@end
