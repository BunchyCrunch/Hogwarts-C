//
//  JSCharacterController.h
//  Hogwarts-C
//
//  Created by Josh Sparks on 10/8/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSCharacter.h"

NS_ASSUME_NONNULL_BEGIN

@interface JSCharacterController : NSObject

+(instancetype)sharedInstance;

+ (void)fetchCharacters:(void(^)(NSArray<JSCharacter *> *character))completion;

@end

NS_ASSUME_NONNULL_END
