//
//  NSSetFunctional.m
//  CoreParse
//
//  Created by Tom Davie on 06/03/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import "NSSetFunctional.h"


@implementation NSSet (Functional)

- (NSSet *)cp_map:(id(^)(id obj))block
{
    NSUInteger c = [self count];
    NSMutableArray *resultingObjects = [NSMutableArray arrayWithCapacity:c];
    
    NSUInteger nonNilCount = 0;
    for (id obj in self)
    {
        id r = block(obj);
        if (nil != r)
        {
            resultingObjects[nonNilCount] = r;
            nonNilCount++;
        }
    }

    return [NSSet setWithArray:[resultingObjects subarrayWithRange:NSMakeRange(0, nonNilCount)]];
}

@end
