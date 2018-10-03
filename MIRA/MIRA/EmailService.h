//
//  EmailService.h
//  MIRA
//
//  Created by Alson on 3/10/18.
//  Copyright © 2018 ITE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>

@interface EmailService : NSObject

@property NSString* emailTitle;
@property NSString* emailBody;
@property NSData* attachmentPath;
@property NSMutableArray* recipents;

- (instancetype)initWithTitle: (NSString*)title
                      andBody: (NSString*)body
                  andCategory: (NSString*)category
              andResourcePath: (NSString*)resourcePath;

-(void)sendEmailWithFileName: (NSString*) fileName
               andSourceType: (NSString*) sourceType
                   andSender: (id)sender;

@end
