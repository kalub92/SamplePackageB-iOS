#import "ThirdPartyAdapter.hpp"
#import <OneSignal/OneSignal.h> // Import the OneSignal framework
#import <OneSignalExtension/OneSignalExtension.h> // Import the OneSignalExtension framework

@implementation ThirdPartyAdapter

#define kIdentitifier "ThirdPartyAdapter.kIdentitifier"

+ (instancetype)sharedInstance {
    static ThirdPartyAdapter *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)initializeWithAppId:(NSString *)appId {
    [OneSignal initWithLaunchOptions:nil];
}

- (void)sendTag:(NSString *)key value:(NSString *)value {
    [OneSignal sendTag:key value:value];
}

- (void)getTagsWithCompletion:(void (^)(NSDictionary<NSString *, NSString *> *tags))completion {
    [OneSignal getTags:^(NSDictionary *result) {
        if (completion) {
            completion(result);
        }
    }];
}

- (void)didReceiveNotificationExtensionRequest:(UNNotificationRequest *)request {
    [OneSignalExtension didReceiveNotificationExtensionRequest:request
                                withMutableNotificationContent:nil
                                            withContentHandler:nil];
}

@end
