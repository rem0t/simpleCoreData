//
//  AppDelegate.h
//  CoreDataTest
//
//  Created by Vladislav Kalaev on 03.03.17.
//  Copyright © 2017 Vladislav Kalaev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

