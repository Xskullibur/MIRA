//
//  firebaseFunc.m
//  MIRA
//
//  Created by Alson on 21/10/18.
//  Copyright © 2018 ITE. All rights reserved.
//

#import "firebaseFunc.h"

@implementation firebaseFunc

+ (FIRStorageUploadTask*)fireStorageSetupWithFolderName:(NSString *)FolderName ReportType:(NSString *)ReportType Source:(NSURL *)Source{
    //-----     Set FIREBASE REFERENCE      -----//
    //Storage Reference
    FIRStorageReference *storageRef = [[FIRStorage storage] reference];
    FIRStorageReference *folderRef = [storageRef child: FolderName];
    FIRStorageMetadata *metadata = [[FIRStorageMetadata alloc]init];
    
    //-----     Check Start Uploading       -----//
    
    //Open Library (Photo)
    if ([ReportType isEqualToString:@"Photo"]) {
        //Declare File Name
        metadata.contentType = @"image/jpeg";
    }
    
    //Upload File
    FIRStorageUploadTask *upload = [folderRef putFile:Source metadata:metadata];
    
    //-----     Errors only occur in the "Failure" case     -----//
    [upload observeStatus:FIRStorageTaskStatusFailure handler:^(FIRStorageTaskSnapshot *snapshot) {
        if (snapshot.error != nil) {
            switch (snapshot.error.code) {
                case FIRStorageErrorCodeObjectNotFound:
                    
                    NSLog(@"Error: Object Not Found!");
                    
                    break;
                    
                case FIRStorageErrorCodeUnauthorized:
                    NSLog(@"Error: No Authorization To Access File");
                    break;
                    
                case FIRStorageErrorCodeCancelled:
                    NSLog(@"Error: Canceled");
                    break;
                    
                case FIRStorageErrorCodeUnknown:
                    NSLog(@"Error: Unknown Error, Please Inspect Server Response");
                    break;
            }
        }
    }];
    
    return upload;
}

+ (void)fireDatabaseSetupWithReportName:(NSString *)reportName andCategoryType:(NSString *)categoryType andDesc:(NSString *)desc andSender:(NSString *)sender andPath:(NSString *)path andReportType:(NSString *)reportType{
    FIRDatabaseReference* dbRef = [[FIRDatabase database] reference];
    
    NSDictionary* newReport = @{
                                @"Report Name" : reportName,
                                @"Description" : desc,
                                @"Category Type" : categoryType,
                                @"Sender" : sender,
                                @"Storage Path" : path,
                                @"Report Type" : reportType
                                };

    [[dbRef child:@"Reports"].childByAutoId setValue:newReport];
}

@end
