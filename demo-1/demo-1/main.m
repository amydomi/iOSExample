//
//  main.m
//  demo-1
//
//  Created by 黄海 on 2016/11/4.
//  Copyright © 2016年 黄海. All rights reserved.
//

#import <Foundation/Foundation.h>

// C语言和 Objective-C 是可以混合变成的，语法不会冲突

// 尺寸的结构体
typedef struct {
    float width;
    float height;
} iSize;

// 颜色枚举
typedef enum {
    white = 1,
    black
} iColor;

//定义一个iPhone类
@interface Iphone : NSObject {
    @public
    iSize size;
    char name[50];
    iColor color;
}

-(char *)getColor:(iColor)color;

@end

@implementation Iphone

-(char *)getColor:(iColor)nColor {
    switch (nColor) {
        case white:
            return "白色";
            break;
        case black:
            return "黑色";
            break;
        default:
            return "";
            break;
    }
    
}

@end

int main(int argc, const char * argv[]) {
    
    // 类与结构体非常相似。
    // 微观：
    // 1.类有方法函数，结构体没有
    // 2.类有访问控制，可以进行封装，结构体没有
    // 3.类可以继承，结构体不能继承
    // 4.类可以实现多态，结构体不能
    
    // 宏观：
    // 结构体之是简单的数据集合
    // 类是具体事物（简称对象）的一个综合描述。
    
    Iphone *p = [Iphone new];
    strcpy(p->name, "iPhone 4s");
    p->size.width = 320.0f;
    p->size.height = 480.0f;
    p->color = black;
    
    
    printf("name is %s,\nsize is %.0fx%.0f,\ncolor is %s\n", p->name, p->size.width,p->size.height, [p getColor:p->color]);
    
    return 0;
}
