//
//  DetailsTVC.h
//  MIRA
//
//  Created by Alson on 16/8/18.
//  Copyright © 2018 ITE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FirebaseStorage/FirebaseStorage.h>

@interface DetailsTVC : UITableViewController <UIPickerViewDelegate, UIPickerViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

- (IBAction)anonymousSwitchOn:(id)sender;
- (IBAction)browseBtnClicked:(id)sender;
- (IBAction)submitClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UISwitch *anonymousSwitch;
@property (weak, nonatomic) IBOutlet UITextField *nameTxt;
@property (weak, nonatomic) IBOutlet UITextField *nricTxt;
@property (weak, nonatomic) IBOutlet UIPickerView *categoryPicker;
@property (weak, nonatomic) IBOutlet UILabel *sourceNameTxt;

@property NSMutableArray* Categorys;
@property NSString* ReportType;
@property NSString* name;
@property NSURL* Image;

@end
