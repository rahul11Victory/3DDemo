//
//  AppDelegate.h
//  3DRotationDemo
//


#import <UIKit/UIKit.h>

@class ListViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ListViewController *viewController;

/*!
 internal
 @function - createCopyOfTextFile:
 @discussion -This method is to Create a Copy of the Testing file in Documents Directory.
 @param -(NSString*)fileName
 @result - None */
- (void)createCopyOfTextFile:(NSString*)fileName;

@end
