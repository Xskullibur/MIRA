//
//  firebaseFunc.h
//  MIRA
//
//  Created by Alson on 21/10/18.
//  Copyright © 2018 ITE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FirebaseStorage/FirebaseStorage.h>

@interface firebaseFunc : NSObject

+ (FIRStorageUploadTask*)fireStorageSetupWithFolderName :(NSString*)FolderName
                             ReportType:(NSString*)ReportType
                                 Source:(NSURL*)Source;

@end
