
// 判断系统权限及提示的Tool,参考自LBXPermission
// github地址：https://github.com/StenpZ/SZPermission
// 用着顺手还望给个Star。Thank you！

#import "SZPermissionPhotos.h"


@implementation SZPermissionPhotos

+ (BOOL)authorized
{
    return [self authorizationStatus] == PHAuthorizationStatusAuthorized;
}

+ (PHAuthorizationStatus)authorizationStatus
{
    return  [PHPhotoLibrary authorizationStatus];
}

+ (void)authorizeWithCompletion:(void(^)(BOOL granted,BOOL firstTime))completion
{
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    
    switch (status) {
        case PHAuthorizationStatusAuthorized:
        {
            if (completion) {
                completion(YES,NO);
            }
        }
            break;
        case PHAuthorizationStatusRestricted:
        case PHAuthorizationStatusDenied:
        {
            if (completion) {
                completion(NO,NO);
            }
        }
            break;
        case PHAuthorizationStatusNotDetermined:
        {
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                if (completion) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        completion(status == PHAuthorizationStatusAuthorized,YES);
                    });
                }
            }];
        }
            break;
        default:
        {
            if (completion) {
                completion(NO,NO);
            }
        }
            break;
    }
}







@end
