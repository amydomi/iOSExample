//
//  Room.h
//  demo-2
//
//  Created by 黄海 on 2016/11/10.
//  Copyright © 2016年 黄海. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;

@interface Room : NSObject

// 当A中包含B、B中包含A时会造成循环retain，需要将一方改为assign才能避免内存泄漏。
@property(assign, nonatomic) Person *person;

@end
