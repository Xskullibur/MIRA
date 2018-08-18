//
//  MainVC.h
//  MIRA
//
//  Created by Alson on 15/8/18.
//  Copyright © 2018 ITE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainVC : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property NSString* reportType;
@end
