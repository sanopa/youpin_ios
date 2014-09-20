//
//  YOHRecentViewController.m
//  Youpin
//
//  Created by Sophia Anopa on 20.09.14.
//  Copyright (c) 2014 Aiiyoh. All rights reserved.
//

#import "YOHRecentViewController.h"
#import "YOHItemViewController.h"
#import "YOHSearchViewController.h"
#import "YOHCollectionViewController.h"

@interface YOHRecentViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, copy) NSArray *nearbyData;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *locationButton;
@end

@implementation YOHRecentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"YOHRecentViewCell"];
    
    // Do any additional setup after loading the view from its nib.
    NSURLRequest *newRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://partner-api.groupon.com/deals.json?tsToken=b371197d636a2e254f5f2c4ab6b09780aa936463&offset=0&limit=3"]];
    [NSURLConnection sendAsynchronousRequest:newRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSError *error;
        if (!connectionError) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            if (dict) {
                self.nearbyData = dict[@"deals"];
                NSLog(@"%@", self.nearbyData);
                [self.tableView reloadData];
            } else {
                NSLog(@"%@", error.localizedDescription);
            }
            
        } else {
            //reached a connection error
        }
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.nearbyData count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"YOHRecentViewCell"];
    cell.textLabel.text = self.nearbyData[indexPath.row][@"merchant"][@"name"];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    YOHItemViewController *itemvc = [[YOHItemViewController alloc] init];
    itemvc.item = self.nearbyData[indexPath.row];
    [self.navigationController pushViewController:itemvc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1f;
}

- (IBAction)locationChange:(id)sender {
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
