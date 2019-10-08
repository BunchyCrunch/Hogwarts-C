//
//  JSCharacter.m
//  Hogwarts-C
//
//  Created by Josh Sparks on 10/8/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

#import "JSCharacter.h"

static NSString * const kName = @"name";
static NSString * const kHouse = @"house";
static NSString * const kBloodStatus = @"bloodStatus";
static NSString * const kDeathEater = @"deathEater";
static NSString * const kRole = @"role";

@implementation JSCharacter

- (JSCharacter *)initWithName:(NSString *)name house:(NSString *)house bloodStatus:(NSString *)bloodStatus deathEater:(BOOL)deathEater role:(NSString *)role
{
    self = [super init];
    if (self)
    {
        _name = name;
        _house = house;
        _bloodStatus = bloodStatus;
        _deathEater = deathEater;
        _role = role;
    }
    return self;
}
@end

@implementation JSCharacter (JSONConvertable)
- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *name = dictionary[kName];
    NSString *house = dictionary[kHouse];
    NSString *bloodStatus = dictionary[kBloodStatus];
    NSString *deathEater = dictionary[kDeathEater];
    NSString *role = dictionary[kRole];
    
    return [self initWithName:name house:house bloodStatus:bloodStatus deathEater:deathEater role:role];
}

@end
