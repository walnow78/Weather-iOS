//
//  AppDelegate.m
//  Weather
//
//  Created by Pawel Walicki on 20/8/15.
//  Copyright (c) 2015 lemurinthebox. All rights reserved.
//

#import "AppDelegate.h"
#import <AFNetworking/AFNetworking.h>
#import "UIViewController+Navigation.h"
#import "POLCoreDataStack.h"
#import "LEMMainViewController.h"
#import "LEMGeolocation.h"
#import "LEMSettings.h"
#import "LEMDetailViewController.h"

@interface AppDelegate ()

@property(nonatomic,strong) POLCoreDataStack *stack;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    // Init stack.
    
    self.stack = [POLCoreDataStack coreDataStackWithModelName:@"Model"];
    
    // Monitoring activity
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    // Retrive data
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:[LEMGeolocation entityName]];
    
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:LEMGeolocationAttributes.name
                                                              ascending:YES
                                                               selector:@selector(caseInsensitiveCompare:)]];
    
    NSFetchedResultsController *fetch = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                            managedObjectContext:self.stack.context
                                                                              sectionNameKeyPath:nil
                                                                                       cacheName:nil];
    
    // Get the last geolocation for detail view
    
    LEMGeolocation *geolocation = [[self.stack executeFetchRequest:request
                                                       errorBlock:^(NSError *error) {
                                                           NSLog(@"Error retrieve geolocation");
                                                       }] lastObject];
    
    // Check kind of device
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        [self configurationForPadWithFetch:fetch geolocation:geolocation];
    }else{
        [self conigurationforPhoneWithFetch:fetch];
    }
    
    [self autoSave];
    
    return YES;
}

#pragma mark - Private

-(void)save{
    
    [self.stack saveWithErrorBlock:^(NSError *error) {
        NSLog(@"Error save data %s \n\n %@", __func__, error);
    }];
}


-(void)autoSave{
    [self save];
    [self performSelector:@selector(autoSave)
               withObject:nil
               afterDelay:AUTO_SAVE_DELAY];
}

-(void) configurationForPadWithFetch:(NSFetchedResultsController*) fetch geolocation:(LEMGeolocation*) geolocation{
    
    LEMMainViewController *mainVC = [[LEMMainViewController alloc] initWithFetchedResultsController:fetch
                                                                                              style:UITableViewStylePlain];
    
    LEMDetailViewController *detailVC = [[LEMDetailViewController alloc] initWithModel:geolocation];
  
    UISplitViewController *splitVC = [[UISplitViewController alloc] init];
    
    mainVC.delegate = detailVC;
    splitVC.delegate = detailVC;
    
    splitVC.viewControllers = @[[mainVC wrappedInNavigation], [detailVC wrappedInNavigation]];
    
    self.window.rootViewController = splitVC;

}

-(void) conigurationforPhoneWithFetch:(NSFetchedResultsController*) fetch{
    
    LEMMainViewController *mainVC = [[LEMMainViewController alloc] initWithFetchedResultsController:fetch
                                                                                              style:UITableViewStylePlain];
    
    mainVC.delegate = mainVC;
    
    self.window.rootViewController = [mainVC wrappedInNavigation];

    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [self save];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [self save];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
