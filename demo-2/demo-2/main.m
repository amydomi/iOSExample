//
//  main.m
//  demo-2
//
//  Created by 黄海 on 2016/11/10.
//  Copyright © 2016年 黄海. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Room.h"

/*
 
 OC内存管理法则：
 
 1、内存管理对C语言基本数据类型无效，如：int、short、char、long、struct、enum、union
 1、所有继承NSObject的对象都在堆中创建，拥有一个retainCount属性，不会自动释放，需要retainCount为零时系统才会将其释放。
 2、当一个对象使用alloc、new、copy、retain时，retainCount计数器加一，需要调用release或autorelease对计数器减一操作。
 3、谁创建谁释放，谁retain谁release。
 4、已释放的对象指针为野指针，对其发送消息会出错，对象=nil的指针为空指针，发送消息不响应，但不会出错。
 
 ARC和MRC
 1、ARC自动管理内存，Xcode4.x版本后新增特性，不需要写任何retain、release、autorelease，编译器会在适当的位置自动加上这写代码。
 2、MRC是手工管理内存，需要程序员自己写retain、release、autorelease
 3、OC中的ARC内存管理和Java不一样，Java是在运行时动态监测对象，进行垃圾回收，OC中的ARC是在编译阶段自动加上retain和release操作
*/
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p1 = [[Person alloc] init];
        Person *p2 = [[Person alloc] init];
        Room *r1 = [[Room alloc] init];
        p1.room = r1;
        Room *r2 = [[Room alloc] init];
        p1.room = r2; // 更换对象，方法内部释放原对象持有，再将新对象持有+1
        
        // 相同的属性赋值，setRoom不做任何操作
        p1.room = r2;
        p1.room = r2;
        p1.room = r2;
        p1.room = r2;
        p1.room = r2;
        
        p2.room = r1;
        
        // 自己创建的对象自己释放。
        [r2 release];
        [r1 release];
        [p1 release];
        [p2 release];
        
        // 不要尝试对一个释放的对象进行赋值操作，会报错
        // p2.room = r2;
    }
    return 0;
}
