//
//  JSCharacterController.m
//  Hogwarts-C
//
//  Created by Josh Sparks on 10/8/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

#import "JSCharacterController.h"

static NSString * const kBaseURLString = @"https://www.potterapi.com/v1/";
static NSString * const kCharacterString = @"characters";
static NSString * const kApiKeyKey = @"key";
static NSString * const kApiKeyValue = @"$2a$10$YsIBflM6K1FGvn2KaF9jGes0S9UhUMH5L0Qh8FR0JXjXeOOW11byy";


@implementation JSCharacterController

+ (instancetype)sharedInstance
{
    static JSCharacterController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[JSCharacterController alloc] init];
    });
    return sharedInstance;
}

+ (void)fetchCharacters:(void (^)(NSArray<JSCharacter *> * _Nullable))completion
{
    // Step 1: Build URL
    // Base =
    // Component =
    // Query Item =
    
    NSURL *baseURL = [NSURL URLWithString:kBaseURLString];
    NSURL * characterURL = [baseURL URLByAppendingPathComponent:kCharacterString];
    NSURLQueryItem * apiKey = [NSURLQueryItem queryItemWithName:kApiKeyKey value:kApiKeyValue];
    NSURLComponents * components = [NSURLComponents componentsWithURL:characterURL resolvingAgainstBaseURL:true];
    
    components.queryItems = @[apiKey];
    NSURL *finalURL = components.URL;
    
    // Step 2: start the dataTask
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        // Check the error
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        // Handle the response
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        // Handle the data
        if (data)
        {
            // Get the top level
            NSDictionary *topLevelDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            
            // Handle if something went wrong
            if (!topLevelDict)
            {
                NSLog(@"Error parsing JSON data: %@", error);
                completion(nil);
                return;
            }
            //Create a landing zone for the characters
            NSMutableArray *characterArray = [[NSMutableArray alloc] init];
            
            // loop through the TLD and init each dict
            for (NSDictionary *characterDictionary in topLevelDict)
            {
                JSCharacter *character = [[JSCharacter alloc] initWithDictionary:characterDictionary];
                [characterArray addObject:character];
            }
            // complete with that array of character
            completion(characterArray);
        }
        
        
    }]resume];
}

@end
