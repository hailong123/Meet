//
//  DefaultConfigInterface.h
//  Meet
//
//  Created by SeaDragon on 2017/8/13.
//  Copyright © 2017年 SeaDragon. All rights reserved.
//

#ifndef DefaultConfigInterface_h
#define DefaultConfigInterface_h

#define DEFAULT_COLOR [UIColor colorWithHexString:@"#FFE326"]

//判断当前设备是不是iPhone4或者4s
#define IPHONE4S    (([[UIScreen mainScreen] bounds].size.height)==480)

//判断当前设备是不是iPhone5
#define IPHONE5    (([[UIScreen mainScreen] bounds].size.height)==568)

//判断当前设备是不是iPhone6
#define IPHONE6    (([[UIScreen mainScreen] bounds].size.height)==667)

//判断当前设备是不是iPhone6Plus
#define IPHONE6_PLUS    (([[UIScreen mainScreen] bounds].size.height)>=736)

#endif /* DefaultConfigInterface_h */
