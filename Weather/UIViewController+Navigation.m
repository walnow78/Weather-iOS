//
//  UIViewController+Navigation.m
//  Weather
//
//  Created by Pawel Walicki on 20/8/15.
//  Copyright (c) 2015 lemurinthebox. All rights reserved.
//

#import "UIViewController+Navigation.h"

@implementation UIViewController (Navigation)

-(UINavigationController*) wrappedInNavigation{
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:self];
    
    return nav;
}

@end
