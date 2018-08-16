//
//  CategoryVC.m
//  MIRA
//
//  Created by Alson on 16/8/18.
//  Copyright © 2018 ITE. All rights reserved.
//

#import "CategoryVC.h"

@interface CategoryVC ()

@end

@implementation CategoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _Categorys = [[NSMutableArray alloc] initWithObjects:@"Don't Know", @"Acts Of Kindness", @"Energy Conservation Issues", @"Incidents", @"Safety Issues", nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _Categorys.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return _Categorys[row];
}

@end
