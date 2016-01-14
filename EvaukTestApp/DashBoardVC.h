//
//  DashBoardVC.h
//  EvaukTestApp
//
//  Created by Max Rose on 1/6/16.
//  Copyright © 2016 MR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewCell.h"

@interface DashBoardVC : UIViewController <NSURLConnectionDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate>
- (IBAction)buttonAPressed:(id)sender;
- (IBAction)buttonBPressed:(id)sender;
- (IBAction)userButtonPressed:(id)sender;
- (IBAction)chartsButtonPressed:(id)sender;
- (IBAction)bellPressed:(id)sender;
- (IBAction)directionSegChanged:(id)sender;

@property (weak, nonatomic) IBOutlet UISwitch *extra;



@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UISegmentedControl *directionSeg;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property  (nonatomic) IBOutlet UIButton *Bell;
@property (nonatomic, strong)NSMutableDictionary *DashboardData;
@property (nonatomic, strong)NSMutableArray *searchResults;
@end
