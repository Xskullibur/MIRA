//
//  CategoryVC.h
//  MIRA
//
//  Created by Alson on 16/8/18.
//  Copyright © 2018 ITE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryVC : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property NSMutableArray* Categorys;
@property NSString* ReportType;

@end
