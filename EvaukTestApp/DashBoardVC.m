//
//  DashBoardVC.m
//  EvaukTestApp
//
//  Created by Max Rose on 1/6/16.
//  Copyright © 2016 MR. All rights reserved.
//

#import "DashBoardVC.h"
#import "GIBadgeView.h"

@interface DashBoardVC ()

@end

@implementation DashBoardVC

-(void)viewWillAppear:(BOOL)animated{
    [self getNotifications];
    [self doSearch];
    
}
-(void)viewDidAppear:(BOOL)animated{

}
- (void)viewDidLoad {
    [super viewDidLoad];
//    UINib *cellNib = [UINib nibWithNibName:@"CollectionViewCell" bundle:nil];
//    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"cell"];
    self.searchBar.delegate = self;
    
    [self.extra addTarget:self action:@selector(changeSwitch:) forControlEvents:UIControlEventValueChanged];
}
- (void)changeSwitch:(id)sender{
    if([sender isOn]){
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"API URL HERE"]];
        request.HTTPMethod = @"POST";
        NSString *postString = @"method=search&extra=1";
        NSData *postData = [postString dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:postData];
        NSURLSession *session = [NSURLSession sharedSession];
        [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            NSMutableDictionary *results = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions
                                                                             error:&error];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.searchResults = [results objectForKey:@"data"];
                NSLog(@"%@", self.searchResults);
                [self.collectionView reloadData];
            });
        }] resume];
    } else{
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"API URL HERE"]];
        request.HTTPMethod = @"POST";
        NSString *postString = @"method=search&extra=2";
        NSData *postData = [postString dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:postData];
        NSURLSession *session = [NSURLSession sharedSession];
        [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            NSMutableDictionary *results = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions
                                                                             error:&error];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.searchResults = [results objectForKey:@"data"];
                NSLog(@"%@", self.searchResults);
                [self.collectionView reloadData];
            });
        }] resume];;
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    NSString *searchString = self.searchBar.text;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"API URL HERE"]];
    request.HTTPMethod = @"POST";
    NSString *toAppend = @"method=search&filter=";
    NSString *postString = [toAppend stringByAppendingString:searchString];
    NSData *postData = [postString dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:postData];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSMutableDictionary *results = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions
                                                                         error:&error];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.searchResults = [results objectForKey:@"data"];
            NSLog(@"%@", self.searchResults);
            [self.collectionView reloadData];
        });
    }] resume];
}

-(void)getNotifications{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"API URL HERE"]];
    request.HTTPMethod = @"POST";
    NSString *postString = @"method=dashboard";
    NSData *postData = [postString dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:postData];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        self.DashboardData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions
                                                               error:&error];
        dispatch_async(dispatch_get_main_queue(), ^{
//            self.Bell.view.image = [UIImage imageNamed:@"bell.png"];
            GIBadgeView *bellBadge = [GIBadgeView new];
            bellBadge.rightOffset = 30;
            NSInteger notifcationNumber = [[self.DashboardData objectForKey:@"notifications"]integerValue];
            bellBadge.badgeValue = notifcationNumber;
            [self.Bell addSubview:bellBadge];
        });
    }] resume];
}
- (IBAction)buttonAPressed:(id)sender {
    UIAlertController *aAlert= [UIAlertController alertControllerWithTitle:@"Alert!"message:@"This is a test Alert" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *OK = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
    }];
    [aAlert addAction:OK];
    [self presentViewController:aAlert animated:YES completion:nil];
}
- (IBAction)buttonBPressed:(id)sender {
    UIAlertController *bAlert= [UIAlertController alertControllerWithTitle:@"Alert!"message:@"This is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\nThis is a test Alert\n" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *OK = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
    }];
    [bAlert addAction:OK];
    [self presentViewController:bAlert animated:YES completion:nil];
}
- (IBAction)userButtonPressed:(id)sender {
    NSLog(@"user Pressed");
}
- (IBAction)chartsButtonPressed:(id)sender {
    NSLog(@"char Pressed");
}
- (IBAction)bellPressed:(id)sender {
    [self getNotifications];
}

- (IBAction)directionSegChanged:(id)sender {
    switch (self.directionSeg.selectedSegmentIndex) {
        case 0:
        {
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"API HERE URL"]];
            request.HTTPMethod = @"POST";
            NSString *postString = @"method=search&direction=received";
            NSData *postData = [postString dataUsingEncoding:NSUTF8StringEncoding];
            [request setHTTPBody:postData];
            NSURLSession *session = [NSURLSession sharedSession];
            [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                NSMutableDictionary *results = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions
                                                                                 error:&error];
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.searchResults = [results objectForKey:@"data"];
                    NSLog(@"%@", self.searchResults);
                    [self.collectionView reloadData];
                });
            }] resume];
            break;
        }
        case 1:{
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"API URL HERE"]];
            request.HTTPMethod = @"POST";
            NSString *postString = @"method=search&direction=sent";
            NSData *postData = [postString dataUsingEncoding:NSUTF8StringEncoding];
            [request setHTTPBody:postData];
            NSURLSession *session = [NSURLSession sharedSession];
            [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                NSMutableDictionary *results = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions
                                                                                 error:&error];
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.searchResults = [results objectForKey:@"data"];
                    NSLog(@"%@", self.searchResults);
                    [self.collectionView reloadData];
                });
            }] resume];
            break;
        }
        default:
            break;
    }
}

-(void)doSearch{
NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"API URL HERE"]];
request.HTTPMethod = @"POST";
NSString *postString = @"method=search";
NSData *postData = [postString dataUsingEncoding:NSUTF8StringEncoding];
[request setHTTPBody:postData];
NSURLSession *session = [NSURLSession sharedSession];
[[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    NSMutableDictionary *results = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions
                                                           error:&error];
    dispatch_async(dispatch_get_main_queue(), ^{
    self.searchResults = [results objectForKey:@"data"];
        [self.collectionView reloadData];
                });
}] resume];
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.searchResults count];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.amount.text = [@"$" stringByAppendingString:[[self.searchResults objectAtIndex:indexPath.row]objectForKey:@"amount"]];
    cell.fullname.text =[[self.searchResults objectAtIndex:indexPath.row]objectForKey:@"fullname"];
    cell.phoneNumber.text =[[self.searchResults objectAtIndex:indexPath.row]objectForKey:@"phone"];
    cell.customerName.text = [[self.searchResults objectAtIndex:indexPath.row]objectForKey:@"customer_name"];
    cell.customerPhone.text = [[self.searchResults objectAtIndex:indexPath.row]objectForKey:@"customer_phone"];
    NSInteger profileImageNumber = [[[self.searchResults objectAtIndex:indexPath.row]objectForKey:@"profileimage"]integerValue];
    switch (profileImageNumber) {
        case 1:
            cell.profilephoto.image = [UIImage imageNamed:@"headshot_1.png"];
            break;
        case 2:
             cell.profilephoto.image = [UIImage imageNamed:@"headshot_2.png"];
            break;
        case 3:
             cell.profilephoto.image = [UIImage imageNamed:@"headshot_3.png"];
        default:
            break;
    }
    return cell;
}
@end
