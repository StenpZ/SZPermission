
// 判断系统权限及提示的Tool,参考自LBXPermission
// github地址：https://github.com/StenpZ/SZPermission
// 用着顺手还望给个Star。Thank you！

#import <Foundation/Foundation.h>

@interface SZPermissionNetwork : NSObject

+ (BOOL)authorized;

+ (void)authorizeWithCompletion:(void(^)(BOOL granted,BOOL firstTime))completion;

@end
