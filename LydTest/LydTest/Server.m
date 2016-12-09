//
//  Server.m
//  LydTest
//
//  Created by Jan ATAC on 09/12/2016.
//  Copyright © 2016 PERSO. All rights reserved.
//

#import "Server.h"

@implementation Server

-(void)getData{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://api.randomuser.me/"]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10.0];
    [request setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    if (error) {
                                                        NSLog(@"%@", error);
                                                    } else {
                                                        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                                        NSLog(@"%@", httpResponse);
                                                        
                                                        NSError *localError = nil;
                                                        
                                                        NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&localError];
                                                        /*
                                                        NSString* json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                        */
                                                        if (localError != nil) {
                                                            NSLog(@"%@",localError);
                                                        }
                                                        
                                                        NSLog(@"%@", parsedObject);
                                                        
                                                        [[NSNotificationCenter defaultCenter] postNotificationName:@"DATA_RECEIVED" object:parsedObject];
                                                    }
                                                }];
    [dataTask resume];
    
}

@end
