//
//  YOHDataFetcher.h
//  Youpin
//
//  Created by Sophia Anopa on 20.09.14.
//  Copyright (c) 2014 Aiiyoh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YOHDataFetcher : NSObject
+ (void)fetchBusinessWithName:(NSString *)name withBlock:(void(^)(NSURLResponse *response, NSData *data, NSError *connectionError))completionBlock;
@end
