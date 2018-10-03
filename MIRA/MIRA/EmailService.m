//
//  EmailService.m
//  MIRA
//
//  Created by Alson on 3/10/18.
//  Copyright © 2018 ITE. All rights reserved.
//

#import "EmailService.h"

@implementation EmailService

- (instancetype)initWithTitle:(NSString *)title andBody:(NSString *)body andCategory:(NSString *)category andResourcePath:(NSString *)resourcePath
{
    self = [super init];
    if (self) {
        _emailTitle = title;
        _emailBody = body;
        _attachmentPath = [NSData dataWithContentsOfFile:resourcePath];
        
        if ([category isEqualToString:@"Safety Issues"])
            _recipents = [[NSMutableArray alloc]initWithObjects: @"miraite18@gmail.com", nil];
        
        else if ([category isEqualToString:@"Acts of Kindness"])
            _recipents = [[NSMutableArray alloc] initWithObjects: @"miraite18@gmail.com", nil];
                 
        else if ([category isEqualToString:@"Energy Conservation Issues"])
            _recipents = [[NSMutableArray alloc] initWithObjects: @"miraite18@gmail.com", nil];
            
        else if ([category isEqualToString:@"Incidents"])
            _recipents = [[NSMutableArray alloc] initWithObjects: @"miraite18@gmail.com", nil];
    }
    return self;
}

-(void) sendEmailWithFileName:(NSString *)fileName andSourceType:(NSString *)sourceType andSender:(id)sender{
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc]init];
    mc.mailComposeDelegate = sender;
    
    [mc setSubject:_emailTitle];
    [mc setMessageBody:_emailBody isHTML:NO];
    [mc addAttachmentData:_attachmentPath mimeType:sourceType fileName:fileName];
    [mc setToRecipients:_recipents];
    
    [sender presentViewController:mc animated:YES completion:Nil];
    
}

@end
