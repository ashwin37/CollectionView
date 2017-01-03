//
//  ViewController.m
//  CollectionView
//
//  Created by Ashwin Tallapaka on 1/2/17.
//  Copyright © 2017 Ashwin Tallapaka. All rights reserved.
//

#import "ViewController.h"
#import "RecipeCell.h"
#import "RecipeHeaderView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray *recipephotosArray;
@property (strong, nonatomic) NSArray *mainCourseArray;
@property (strong, nonatomic) NSArray *desertArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _recipephotosArray = @[@"egg_benedict.jpg", @"full_breakfast.jpg", @"ham_and_cheese_panini.jpg", @"ham_and_egg_sandwich.jpg", @"hamburger.jpg", @"instant_noodle_with_egg.jpg", @"japanese_noodle_with_pork.jpg", @"mushroom_risotto.jpg", @"noodle_with_bbq_pork.jpg", @"thai_shrimp_cake.jpg", @"vegetable_curry.jpg",@"angry_birds_cake.jpg", @"creme_brelee.jpg", @"green_tea.jpg", @"starbucks_coffee.jpg", @"white_chocolate_donut.jpg"];
    
    UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    collectionViewLayout.sectionInset = UIEdgeInsetsMake(20, 0, 20, 0);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView;
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.recipephotosArray.count;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        
        RecipeHeaderView *recipeHeader = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
       recipeHeader.recipeHeaderLbl.text = [[NSString alloc] initWithFormat:@"Recipe Group #%i", indexPath.section + 1]; // +1 is used to increase the group number
        recipeHeader.recipeHeaderImg.image = [UIImage imageNamed:@"header_banner.png"];
        reusableView = recipeHeader;
    }
    
    if (kind == UICollectionElementKindSectionFooter) {
        RecipeHeaderView *recipeFooter = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
        reusableView = recipeFooter;
    }
    return reusableView;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    RecipeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellCollection" forIndexPath:indexPath];
    UIImageView *recipeImg = (UIImageView *)[cell viewWithTag:110];
    recipeImg.image = [UIImage imageNamed:[_recipephotosArray objectAtIndex:indexPath.row]];
    cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"photo-frame-2.png"]];
    return cell;
}

@end