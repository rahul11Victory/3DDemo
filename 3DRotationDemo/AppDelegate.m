//
//  AppDelegate.m
//  3DRotationDemo
//


#import "AppDelegate.h"

#import "ListViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (void)dealloc{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.viewController = [[[ListViewController alloc] initWithNibName:@"ListViewController" bundle:nil] autorelease];

    // Copy Files from Resources folder to Documents Directory.
    [self createCopyOfTextFile:@"Cow.obj"];
    [self createCopyOfTextFile:@"Tea Pot.obj"];
    [self createCopyOfTextFile:@"Teddy.obj"];
    
    
    // The .mtl file name should match with respective .Obj file. This method should be called for the Number of .mtl files present in the Resource folder.
      //  [self createCopyOfTextFile:@"XXX.mtl"];
    
    UINavigationController *navCtrlr = [[UINavigationController alloc]initWithRootViewController:self.viewController];
    [self.window setRootViewController:navCtrlr];
    [self.window makeKeyAndVisible];
    return YES;
}

/*!
 @function - createCopyOfTextFile:
 @discussion -This method is to Create a Copy of the Testing file in Documents Directory.
 @param -(NSString*)fileName
 @result - None */
- (void)createCopyOfTextFile:(NSString*)fileName{
    // First, test for existence.
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:fileName];
    success = [fileManager fileExistsAtPath:writableDBPath];
    if (success) return;
    // The writable database does not exist, so copy the default to the appropriate location.
    NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:fileName];
    success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
    if (!success) {
        NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
    }
    
    
}


- (void)applicationWillResignActive:(UIApplication *)application{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
