//
//  DetailsTVC.m
//  MIRA
//
//  Created by Alson on 16/8/18.
//  Copyright © 2018 ITE. All rights reserved.
//

#import "DetailsTVC.h"
#import <QuartzCore/QuartzCore.h>

@interface DetailsTVC ()

@end

@implementation DetailsTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupKeyboardDismissTaps];
    
    //Browse Text Box Design
    _sourceNameTxt.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _sourceNameTxt.layer.borderWidth = 1.0;
    
    //-----     Category Picker View        ------//
    _Categorys = [[NSMutableArray alloc] initWithObjects:@"Safety Issues", @"Acts Of Kindness", @"Energy Conservation Issues", @"Incidents", nil];
    [_categoryPicker selectRow:ceil(_Categorys.count / 2) inComponent:0 animated:NO];
    
    //-----     Location PickerxView        ------//
    _Floor = [[NSMutableArray alloc] initWithObjects:@"Level 1", @"Level 2", @"Level 3", @"Level 4", @"Level 5", @"Level 6", @"Level 7", nil];
    _Block = [[NSMutableArray alloc] initWithObjects:@"Block A", @"Block B", @"Block C", @"Block D", @"Block E", @"Block F", @"Block G", @"Block H", @"Block J", @"Block K", @"Aquatic Centre", @"Amphi Theatre", @"Football Field",nil];
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dismissKeyboard{
    [self.view endEditing:YES];
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self dismissKeyboard];
}
-(void)setupKeyboardDismissTaps {
    //Tap Gesture
    UITapGestureRecognizer *TGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    [self.tableView addGestureRecognizer:TGR];
    
    //Swipe Up Gesture
    UISwipeGestureRecognizer *SGRup = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    SGRup.cancelsTouchesInView = NO;
    SGRup.direction = UISwipeGestureRecognizerDirectionUp;
    [self.tableView addGestureRecognizer:SGRup];
    
    //Down
    UISwipeGestureRecognizer *SGRdown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    SGRdown.cancelsTouchesInView = NO;
    SGRdown.direction = UISwipeGestureRecognizerDirectionDown;
    [self.tableView addGestureRecognizer:SGRdown];
    
    //Left
    UISwipeGestureRecognizer *SGRleft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    SGRleft.cancelsTouchesInView = NO;
    SGRleft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.tableView addGestureRecognizer:SGRleft];
    
    //Right
    UISwipeGestureRecognizer *SGRright = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    SGRright.cancelsTouchesInView = NO;
    SGRright.direction = UISwipeGestureRecognizerDirectionRight;
    [self.tableView addGestureRecognizer:SGRright];
}

//Progress Bar
-(void)showProgressBar{
    
    float width = 232;
    float height = 5;
    
    _progBar = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    _progBar.backgroundColor = [UIColor colorWithWhite:0.75f alpha:1.0f];
    [_progBar setFrame:CGRectMake(0, 0, width, height)];
    [_progBar setTrackTintColor:[UIColor colorWithWhite:0.75f alpha:1.0f]];
    [_progBar setProgressTintColor:[UIColor colorWithRed:21.0f/255.0f green:126.0f/255.0f blue:251.0f/255.0f alpha:1.0f]];
    _progBar.alpha = 0.0;
    [[UIApplication sharedApplication].keyWindow addSubview:_progBar];
    _progBar.center = _progBar.superview.center;
    [_progBar setFrame:CGRectMake(_progBar.frame.origin.x, _progBar.frame.origin.y+25, _progBar.frame.size.width, _progBar.frame.size.height)];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:2.0];
    [_progBar setAlpha:1.0];
    [UIView commitAnimations];
    
}

#pragma mark - Picker view data source

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _Categorys.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return _Categorys[row];
}

#pragma mark - Table view data source

-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
    
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView*)view;
    [header.textLabel setTextColor:[UIColor whiteColor]];
    [header.textLabel setFont:[UIFont boldSystemFontOfSize:[header.textLabel.font pointSize]]];
    
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)anonymousSwitchOn:(id)sender {
    
    if (_anonymousSwitch.isOn) {
        _nameTxt.text = NULL;
        _nricTxt.text = NULL;
        _nameTxt.enabled = NO;
        _nricTxt.enabled = NO;
    }
    else{
        _nameTxt.enabled = YES;
        _nricTxt.enabled = YES;
    }
    
}

- (IBAction)browseBtnClicked:(id)sender {
    
    UIImagePickerController *ImageVideoPicker = [[UIImagePickerController alloc] init];
    ImageVideoPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    if ([_ReportType isEqualToString:@"Video"]) {
        ImageVideoPicker.mediaTypes = @[(NSString*)kUTTypeMovie, (NSString*)kUTTypeAVIMovie, (NSString*)kUTTypeVideo, (NSString*)kUTTypeMPEG4];
    }
    
    ImageVideoPicker.delegate = self;
    ImageVideoPicker.allowsEditing = YES;
    [self presentViewController:ImageVideoPicker animated:YES completion:nil];
    
}

#pragma mark - Image Picker Settings

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    picker.delegate = self;
    
    //Image Setting
    if ([_ReportType isEqualToString:@"Photo"]) {
        _Source = [info valueForKey:UIImagePickerControllerImageURL];
    }
    else{
        _Source = [info valueForKey:UIImagePickerControllerMediaURL];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    _sourceNameTxt.text = [_Source lastPathComponent];
    
}


//User Cancel Image Picker
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//User Clicks Submit
- (IBAction)submitClicked:(id)sender {
    
    NSString* category;
    NSString* categoryFolder;
    
    //-----     Check For Report Category       -----//
    
    switch ([_categoryPicker selectedRowInComponent:0]) {
        //Safety Issue
        case 0:
            categoryFolder = @"Safety Issues";
            break;
            
        //Acts of Kindness
        case 1:
            categoryFolder = @"Acts of Kindness";
            break;

        //Energy Conservation Issues
        case 2:
            categoryFolder = @"Energy Conservation Issues";
            break;
            
        //Incidents
        case 3:
            categoryFolder = @"Incidents";
            break;
            
        default:
            break;
    }
    category = categoryFolder;
    categoryFolder = [categoryFolder stringByAppendingString:@"/"];
    
    //-----     Check if Anonymous Chosen       -----//
    
    //Incorrect Format
    if (!_anonymousSwitch.isOn && (!_nricTxt.hasText || !_nameTxt.hasText)) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Missing Fields" message:@"Please Fill in your NRIC and Name if you do not wish to be Anonymous" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* okButton = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        
        [alert addAction: okButton];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else{
        //Correct Format
        if (!_anonymousSwitch.isOn) {
            _name = [NSString stringWithFormat:@"%@, %@", _nricTxt.text, _nameTxt.text];
        }
        else{
             _name = @"Anonymous";
        }
        
        //-----     Check Report Source     -----//
        if (_Source == nil) {
            
            //Alert For  Missing Image
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Source Missing" message:@"Please Browse For An Image To Submit" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* okButton = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
            
            [alert addAction: okButton];
            [self presentViewController:alert animated:YES completion:nil];
            
        }
        else{
            
            //-----     Format Folder Name      -----//
            NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
            [dateFormat setDateStyle:NSDateFormatterMediumStyle];
            [dateFormat setTimeStyle:NSDateFormatterShortStyle];
            NSString *folderName = [NSString stringWithFormat:@"%@/%@%@%@%@",categoryFolder , [dateFormat stringFromDate:[NSDate date]], @" - (", _name, @")"];
            
            //-----     FIRESTORE REFERENCE      -----//
            //Storage Reference
            FIRStorageReference *folderRef = [[[FIRStorage storage] reference] child: folderName];
            FIRStorageMetadata *metadata = [[FIRStorageMetadata alloc]init];
            
            //Check if Image
            if ([_ReportType isEqualToString:@"Photo"]) {
                //Declare File Name
                metadata.contentType = @"image/jpeg";
            }
            
            //Upload File
            FIRStorageUploadTask *upload = [folderRef putFile:_Source metadata:metadata completion:^(FIRStorageMetadata *metadata, NSError *error){
                //Download URL
                [folderRef downloadURLWithCompletion:^(NSURL * _Nullable URL, NSError * _Nullable error){
                    if (error != nil) {
                        NSLog(@"%@", error);
                    }
                    else{
                        self->_strPath = URL.absoluteString;
                        FIRDatabaseReference* postRef = [firebaseFunc fireDatabaseSetupWithReportName:folderName andCategoryType:self->_ReportType andDesc:self->_descTxt.text andSender:self->_name andPath:self->_strPath];
                    }
                    
                }];
            }];
            
            //-----     Upload Progress         -----//
            //Progress Bar
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Uploading Files" message:@"Please wait while we upload the files" preferredStyle:UIAlertControllerStyleAlert];
            
            [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
                [[self progBar] removeFromSuperview];
                [upload cancel];
            }]];
            
            [self presentViewController:alert animated:YES completion:^{
                [self showProgressBar];
            }];
            //Upload Progress
            [upload observeStatus:FIRStorageTaskStatusProgress handler:^(FIRStorageTaskSnapshot *snapshot) {
                double percentComplete = 100.0 * (snapshot.progress.completedUnitCount) / (snapshot.progress.totalUnitCount);
                
                NSLog(@"Upload Percent: %lf", percentComplete);
                
                if (percentComplete >= 100) {
                    [[self progBar] removeFromSuperview];
                    [self dismissViewControllerAnimated:alert completion:nil];
                }
                else{
                    [self progBar].progress = percentComplete/100.0;
                }
                
            }];
            
            //-----     Firebase Observers      -----//
            //Check if completed
            [upload observeStatus:FIRStorageTaskStatusSuccess handler:^(FIRStorageTaskSnapshot *snapshot) {
                
                [upload removeAllObservers];
                
                UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Upload Successful" message:@"Thank You, Your Report Will Be Reviewed and Actions Will Be Taken If Necessary" preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction* okButton = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction *PresentSegue){
                    
                    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"MIRA"];
                    [self presentViewController:vc animated:YES completion:nil];
                    
                }];
                [alert addAction: okButton];
                [self presentViewController:alert animated:YES completion:nil];
            }];
            
        }
    }
}

@end
