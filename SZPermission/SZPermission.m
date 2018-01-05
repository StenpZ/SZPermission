
// 判断系统权限及提示的Tool,参考自LBXPermission
// github地址：https://github.com/StenpZ/SZPermission
// 用着顺手还望给个Star。Thank you！

#import "SZPermission.h"
#import <UIKit/UIKit.h>

#import "SZPermissionCamera.h"
#import "SZPermissionPhotos.h"
#import "SZPermissionContacts.h"
#import "SZPermissionLocation.h"
#import "SZPermissionHealth.h"
#import "SZPermissionCalendar.h"
#import "SZPermissionReminders.h"
#import "SZPermissionMicrophone.h"
#import "SZPermissionNetwork.h"

@implementation SZPermission


+ (BOOL)isServicesEnabledWithType:(SZPermissionType)type
{
    if (type == SZPermissionType_Location) {
        return [SZPermissionLocation isServicesEnabled];
    }
    
    return YES;
}

+ (BOOL)isDeviceSupportedWithType:(SZPermissionType)type
{
    if (type == SZPermissionType_Health) {
        
        return  [SZPermissionHealth isHealthDataAvailable];
    }
    
    return YES;
}

+ (BOOL)authorizedWithType:(SZPermissionType)type
{
    switch (type) {
        case SZPermissionType_Location:
            return [SZPermissionLocation authorized];
            break;
        case SZPermissionType_Camera:
            return [SZPermissionCamera authorized];
            break;
        case SZPermissionType_Photos:
            return [SZPermissionPhotos authorized];
            break;
        case SZPermissionType_Contacts:
            return [SZPermissionContacts authorized];
            break;
        case SZPermissionType_Reminders:
            return [SZPermissionReminders authorized];
            break;
        case SZPermissionType_Calendar:
            return [SZPermissionCalendar authorized];
            break;
        case SZPermissionType_Microphone:
            return [SZPermissionMicrophone authorized];
            break;
        case SZPermissionType_Health:
            return [SZPermissionHealth authorized];
            break;
        case SZPermissionType_Network:
            return [SZPermissionNetwork authorized];
            break;
        default:
            break;
    }
    return NO;
}

+ (void)authorizeWithType:(SZPermissionType)type completion:(void(^)(BOOL granted,BOOL firstTime))completion
{
    switch (type) {
        case SZPermissionType_Location:
            return [SZPermissionLocation authorizeWithCompletion:completion];
            break;
        case SZPermissionType_Camera:
            return [SZPermissionCamera authorizeWithCompletion:completion];
            break;
        case SZPermissionType_Photos:
            return [SZPermissionPhotos authorizeWithCompletion:completion];
            break;
        case SZPermissionType_Contacts:
            return [SZPermissionContacts authorizeWithCompletion:completion];
            break;
        case SZPermissionType_Reminders:
            return [SZPermissionReminders authorizeWithCompletion:completion];
            break;
        case SZPermissionType_Calendar:
            return [SZPermissionCalendar authorizeWithCompletion:completion];
            break;
        case SZPermissionType_Microphone:
            return [SZPermissionMicrophone authorizeWithCompletion:completion];
            break;
        case SZPermissionType_Health:
            return [SZPermissionHealth authorizeWithCompletion:completion];
            break;
        case SZPermissionType_Network:
            return [SZPermissionNetwork authorizeWithCompletion:completion];
            break;
            
        default:
            break;
    }
}

@end
