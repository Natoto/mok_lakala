//
//  NSObject+DEDAO.h
//  IPAPatch
//
//  Created by boob on 2017/6/7.
//  Copyright © 2017年 Weibo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JRSwizzle/JRSwizzle.h>
#import <objc/runtime.h>

#define WeChatService(classname) (classname *)[[CBGetClass(MMServiceCenter) defaultCenter] getService:CBGetClass(classname)]

#define CBGetClass(classname) objc_getClass(#classname)
#define CBRegisterClass(superclassname, subclassname) { Class class = objc_allocateClassPair(CBGetClass(superclassname), #subclassname, 0);objc_registerClassPair(class); }
#define CBHookInstanceMethod(classname, ori_sel, new_sel) { NSError *error; [CBGetClass(classname) jr_swizzleMethod:ori_sel withMethod:new_sel error:&error]; if(error) NSLog(@"%@", error); }
#define CBHookClassMethod(classname, ori_sel, new_sel) { NSError *error; [CBGetClass(classname) jr_swizzleClassMethod:ori_sel withClassMethod:new_sel error:&error]; if(error) NSLog(@"%@", error); }
#define CBGetInstanceValue(obj, valuename) object_getIvar(obj, class_getInstanceVariable([obj class], #valuename))
#define CBSetInstanceValue(obj, valuename, value) object_setIvar(obj, class_getInstanceVariable([obj class], #valuename), value)

@interface NSObject(DEDAO) 

@end
