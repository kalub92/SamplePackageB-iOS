#import <Foundation/Foundation.h>

@interface ThirdPartyAdapter : NSObject

+ (instancetype)sharedInstance;
- (void)initializeWithAppId:(NSString *)appId;
- (void)sendTag:(NSString *)key value:(NSString *)value;
- (void)getTagsWithCompletion:(void (^)(NSDictionary<NSString *, NSString *> *tags))completion;

@end
