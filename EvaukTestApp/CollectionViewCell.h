//
//  CollectionViewCell.h
//  EvaukTestApp
//
//  Created by Aditya Narayan on 1/7/16.
//  Copyright © 2016 MR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell

@property(retain, nonatomic) IBOutlet UILabel *amount;
@property(retain, nonatomic) IBOutlet UILabel *fullname;
@property(retain, nonatomic) IBOutlet UILabel *phoneNumber;
@property(retain, nonatomic) IBOutlet UILabel *customerName;
@property(retain, nonatomic) IBOutlet UILabel *customerPhone;
@property(retain, nonatomic) IBOutlet UIImageView *profilephoto;

@end
