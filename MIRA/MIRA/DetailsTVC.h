//
//  DetailsTVC.h
//  MIRA
//
//  Created by Alson on 16/8/18.
//  Copyright © 2018 ITE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "firebaseFunc.h"
#import <FirebaseStorage/FirebaseStorage.h>
#import <FirebaseDatabase/FirebaseDatabase.h>
#import <FirebaseCore/FirebaseCore.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface DetailsTVC : UITableViewController <UIPickerViewDelegate, UIPickerViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIScrollViewDelegate>

- (IBAction)anonymousSwitchOn:(id)sender;
- (IBAction)browseBtnClicked:(id)sender;
- (IBAction)submitClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UISwitch *anonymousSwitch;
@property (weak, nonatomic) IBOutlet UITextField *nameTxt;
@property (weak, nonatomic) IBOutlet UITextField *nricTxt;
@property (weak, nonatomic) IBOutlet UIPickerView *categoryPicker;
@property (weak, nonatomic) IBOutlet UILabel *sourceNameTxt;
@property (weak, nonatomic) IBOutlet UITextView *descTxt;
@property (weak, nonatomic) IBOutlet UIPickerView *locationPicker;

@property NSMutableArray* Categorys;
@property NSMutableArray* Floor;
@property NSMutableArray* Block;

@property NSString* ReportType;
@property NSString* name;
@property NSURL* Source;
@property UIProgressView* progBar;

@end
