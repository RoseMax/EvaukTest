//
//  chartVC.m
//  EvaukTestApp
//
//  Created by Max Rose on 1/7/16.
//  Copyright © 2016 MR. All rights reserved.
//

#import "chartVC.h"

@interface chartVC ()

@end

@implementation chartVC

-(void)viewDidAppear:(BOOL)animated{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"API URL HERE"]];
    request.HTTPMethod = @"POST";
    NSString *postString = @"method=chart";
    NSData *postData = [postString dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:postData];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
       self.chartData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions
                                                               error:&error];
          dispatch_async(dispatch_get_main_queue(), ^{
              self.charText.text = [NSString stringWithFormat:@"my dictionary is %@", self.chartData];
        });
    }] resume];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
