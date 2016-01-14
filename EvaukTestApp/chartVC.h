//
//  chartVC.h
//  EvaukTestApp
//
//  Created by Max Rose on 1/7/16.
//  Copyright © 2016 MR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface chartVC : UIViewController
@property (nonatomic, strong)NSMutableDictionary *chartData;
@property (weak, nonatomic) IBOutlet UITextView *charText;




@end
