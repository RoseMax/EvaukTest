//
//  profileVC.h
//  EvaukTestApp
//
//  Created by Max Rose on 1/7/16.
//  Copyright © 2016 MR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface profileVC : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *profileText;
@property (nonatomic, strong)NSMutableDictionary *profileData;

@end
