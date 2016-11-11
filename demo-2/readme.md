###OC内存管理法则：

    1、内存管理对C语言基本数据类型无效，如：int、short、char、long、struct、enum、union
    2、所有继承NSObject的对象都在堆中创建，拥有一个retainCount属性，不会自动释放，需要retainCount为零时系统才会将其释放。
    3、当一个对象使用alloc、new、copy、retain时，retainCount计数器加一，需要调用release或autorelease对计数器减一操作。
    4、谁创建谁释放，谁retain谁release。
    5、已释放的对象指针为野指针，对其发送消息会出错，对象=nil的指针为空指针，发送消息不响应，但不会出错。
    6、当两个对象互相持有对方时，会造成循环retain，需要将其中一方改为assign方式才能避免内存泄漏。

###ARC和MRC
    1、ARC自动管理内存，Xcode4.x版本后新增特性，不需要写任何retain、release、autorelease，编译器会在适当的位置自动加上这写代码。
    2、MRC是手工管理内存，需要程序员自己写retain、release、autorelease
    3、OC中的ARC内存管理和Java不一样，Java是在运行时动态监测对象，进行垃圾回收，OC中的ARC是在编译阶段自动加上retain和release操作

###@clsss 类;
    1、在.h头文件使用@class 声明一个类可以减速编译效率，减少互相调用产生的错误引用。
    2、在.m文件中再使用#import进行导入。

###@property参数总结
读写属性
    readwrite （默认）自动实现getter、setter方法
    readonly   只实现getter方法

重命名
    getter=method 重命名getter的方法名，一般属性为BOOL值时改为 isXXXX 方式。
    setter=method 重命名setter的方法名，很少使用

原子性
    nonatomic 多线程不加锁，能快速响应，iOS中常用
    atomic 多线程加锁，响应速度慢，Mac OS中常用

内存管理
    assign （默认）正常的getter、setter方法实现，不参与内存管理，常用于C语言基本数据类型，OC对象互相持有时，有一方需要设置为assign
    retain  自动添加setter方法中的retain方法的实现，参与内存管理。
