//
//  MainVC.m
//  MIRA
//
//  Created by Alson on 15/8/18.
//  Copyright © 2018 ITE. All rights reserved.
//

#import "MainVC.h"
#import "CategoryVC.h"

@interface MainVC ()

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    CategoryVC *vc = [segue destinationViewController];
    
    if ([_tableview indexPathForSelectedRow] == 0) {
        vc.ReportType = @"Photo";
    }
    else{
        vc.ReportType = @"Video";
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        UITableViewCell* Camera = [tableView dequeueReusableCellWithIdentifier:@"Camera"];
        return Camera;
    }
    else{
        UITableViewCell* Video = [tableView dequeueReusableCellWithIdentifier:@"Video"];
        return Video;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  180;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"showCategory" sender:nil];
}

@end
