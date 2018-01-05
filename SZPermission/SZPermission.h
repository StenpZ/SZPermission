
// 判断系统权限及提示的Tool,参考自LBXPermission
// github地址：https://github.com/StenpZ/SZPermission
// 用着顺手还望给个Star。Thank you！

#import <Foundation/Foundation.h>
#import "SZPermissionSetting.h"

typedef NS_ENUM(NSInteger, SZPermissionType)
{
    SZPermissionType_Location,
    SZPermissionType_Camera,
    SZPermissionType_Photos,
    SZPermissionType_Contacts,
    SZPermissionType_Reminders,
    SZPermissionType_Calendar,
    SZPermissionType_Microphone,
    SZPermissionType_Health,
    SZPermissionType_Network
};

@interface SZPermission : NSObject

/**
 only effective for location servince,other type reture YES


 @param type permission type,when type is not location,return YES
 @return YES if system location privacy service enabled NO othersize
 */
+ (BOOL)isServicesEnabledWithType:(SZPermissionType)type;


/**
 whether device support the type

 @param type permission type
 @return  YES if device support

 */
+ (BOOL)isDeviceSupportedWithType:(SZPermissionType)type;

/**
 whether permission has been obtained, only return status, not request permission
 for example, u can use this method in app setting, show permission status
 in most cases, suggest call "authorizeWithType:completion" method

 @param type permission type
 @return YES if Permission has been obtained,NO othersize
 */
+ (BOOL)authorizedWithType:(SZPermissionType)type;


/**
 request permission and return status in main thread by block.
 execute block immediately when permission has been requested,else request permission and waiting for user to choose "Don't allow" or "Allow"

 @param type permission type
 @param completion May be called immediately if permission has been requested
 granted: YES if permission has been obtained, firstTime: YES if first time to request permission
 */
+ (void)authorizeWithType:(SZPermissionType)type completion:(void(^)(BOOL granted,BOOL firstTime))completion;





@end
