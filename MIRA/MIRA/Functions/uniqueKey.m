//
//  uniqueKey.m
//  MIRA
//
//  Created by Alson on 21/10/18.
//  Copyright © 2018 ITE. All rights reserved.
//

#import "uniqueKey.h"

@implementation uniqueKey

+ (NSString *)generateUUID{
    
    CFUUIDRef uuidRef = CFUUIDCreate(NULL);
    CFStringRef uuidStringRef = CFUUIDCreateString(NULL, uuidRef);
    CFRelease(uuidRef);
    return (NSString*)CFBridgingRelease(uuidStringRef);
    
}

@end
