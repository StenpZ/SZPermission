
// 判断系统权限及提示的Tool,参考自LBXPermission
// github地址：https://github.com/StenpZ/SZPermission
// 用着顺手还望给个Star。Thank you！

#import "SZPermissionNetwork.h"
@import CoreTelephony;

@implementation SZPermissionNetwork


+ (BOOL)authorized
{
    if (@available(iOS 9,*))
    {
        CTCellularData *cellularData = [[CTCellularData alloc] init];
        CTCellularDataRestrictedState status = cellularData.restrictedState;
        
        return status == kCTCellularDataNotRestricted;
    }
    
    return YES;
}

+ (void)authorizeWithCompletion:(void(^)(BOOL granted,BOOL firstTime))completion
{
    if (@available(iOS 9,*)) {
        
        CTCellularData *cellularData = [[CTCellularData alloc] init];
        CTCellularDataRestrictedState status = cellularData.restrictedState;
        
        switch (status) {
            case kCTCellularDataNotRestricted:
            {
                //没有限制
                completion(YES,NO);
            }
                break;
            case kCTCellularDataRestricted:
            {
                //限制
                completion(YES,NO);
            }
                break;
            case kCTCellularDataRestrictedStateUnknown:
            {
                cellularData.cellularDataRestrictionDidUpdateNotifier = ^(CTCellularDataRestrictedState state)
                {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (state == kCTCellularDataNotRestricted) {
                            //没有限制
                            completion(YES,YES);
                        }
                        else{
                            //
                            completion(NO,YES);
                        }
                    });
                };
            }
                break;
                
            default:
                break;
        }
    }
    else
    {
        completion(YES,NO);
    }

}

@end
