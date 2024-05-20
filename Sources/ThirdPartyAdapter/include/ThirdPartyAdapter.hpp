#import <Foundation/Foundation.h>
#import <UserNotifications/UserNotifications.h>

@interface ThirdPartyAdapter : NSObject

+ (instancetype)sharedInstance;
- (void)initializeWithAppId:(NSString *)appId;
- (void)sendTag:(NSString *)key value:(NSString *)value;
- (void)getTagsWithCompletion:(void (^)(NSDictionary<NSString *, NSString *> *tags))completion;

- (void)getTagsWithCompletion:(void (^)(NSDictionary<NSString *, NSString *> *tags))completion;

- (void)didReceiveNotificationExtensionRequest:(UNNotificationRequest*)request;

@end
