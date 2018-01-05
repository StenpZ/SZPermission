
// 判断系统权限及提示的Tool,参考自LBXPermission
// github地址：https://github.com/StenpZ/SZPermission
// 用着顺手还望给个Star。Thank you！

#import <Foundation/Foundation.h>
#import <Contacts/Contacts.h>

@interface SZPermissionContacts : NSObject

+ (BOOL)authorized;

/**
 access authorizationStatus
 
 @return ABAuthorizationStatus(prior to iOS 9) or CNAuthorizationStatus(after iOS 9)
 */
+ (NSInteger)authorizationStatus;

+ (void)authorizeWithCompletion:(void(^)(BOOL granted,BOOL firstTime))completion;

@end
