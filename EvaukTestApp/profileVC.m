//
//  profileVC.m
//  EvaukTestApp
//
//  Created by Max Rose on 1/7/16.
//  Copyright © 2016 MR. All rights reserved.
//

#import "profileVC.h"

@interface profileVC ()

@end

@implementation profileVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"API URL HERE"]];
    request.HTTPMethod = @"POST";
    NSString *postString = @"method=get_user&id=1";
    NSData *postData = [postString dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:postData];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
       self.profileData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions
                                                                         error:&error];
        dispatch_async(dispatch_get_main_queue(), ^{
              self.profileText.text = [NSString stringWithFormat:@"my dictionary is %@", self.profileData];
        });
    }] resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
