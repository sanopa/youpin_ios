//
//  YOHDataFetcher.m
//  Youpin
//
//  Created by Sophia Anopa on 20.09.14.
//  Copyright (c) 2014 Aiiyoh. All rights reserved.
//

#import "YOHDataFetcher.h"

static NSString * const kConsumerKey       = @"wZQSVDpZ633DPAaISGYUzg";
static NSString * const kConsumerSecret    = @"6hcEZdWMo42uhlLaHLbTjeQOuPo";
static NSString * const kToken             = @"P8oqL5IC-rbTdsE7EiMAh1pJoY0axO8d";
static NSString * const kTokenSecret       = @"Gag21X2yeXX8yIcpdDWJKRmdbZ4";
static NSString * const kSignatureMethod   = @"HMAC-SHA1";

@implementation YOHDataFetcher
+ (void)fetchBusinessWithName:(NSString *)name withBlock:(void(^)(NSURLResponse *response, NSData *data, NSError *connectionError))completionBlock
{
    NSString *modString = [name stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.yelp.com/v2/search?oauth_consumer_key=%@&oauth_nonce=%@&oauth_signature_method=%@&oauth_timestamp=%@&oauth_token=%@&term=%@", kConsumerKey, [self generateNonce], kSignatureMethod, [self generateTimestamp], kToken, modString]];
    NSLog(@"%@", [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil]);
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:[NSOperationQueue mainQueue] completionHandler:completionBlock];
}
+ (NSString *)generateTimestamp {
    return [NSString stringWithFormat:@"%d", (int)[[NSDate date] timeIntervalSince1970]];
}

+ (NSString *)generateNonce {
    NSString *nonce;
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    nonce = (__bridge NSString *)string;
    return nonce;
}
@end
