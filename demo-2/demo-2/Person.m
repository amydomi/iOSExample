//
//  Person.m
//  demo-2
//
//  Created by 黄海 on 2016/11/10.
//  Copyright © 2016年 黄海. All rights reserved.
//

#import "Person.h"
#import "Room.h"

@implementation Person

- (Room *)room {
    return _room;
}

// 1、传入的参数和成员变量相同，不做任何操作（防止相同对象重复赋值操作）
// 2、传入的参数和成员变量不同，释放原对象持有，新对象持有+1（持有对象，计数器加一）
// 3、不用担心初始化时释放对象持有，OC向nil发送消息不报错。
- (void)setRoom:(Room *)room {
    if(_room != room) {
        [_room release];
        _room = [room retain];
    }
}

// 对象销毁时，释放所有对象的持有
- (void)dealloc {
    //[_room release];
    self.room = nil;    // 最好的方法，调用setRoom方法将_room release后并设置为nil
    NSLog(@"%s", __func__);
    [super dealloc];
}
@end
