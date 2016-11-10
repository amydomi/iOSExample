//
//  Person.h
//  demo-2
//
//  Created by 黄海 on 2016/11/10.
//  Copyright © 2016年 黄海. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Room.h"

@interface Person : NSObject {
    Room *_room;
}

// @property的retain参数，自动添加和释放对象的持有
// @property (retain) Room *room;

- (Room *)room;
- (void)setRoom:(Room *)room;

@end
