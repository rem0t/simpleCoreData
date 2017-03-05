//
//  DetailVC.h
//  CoreDataTest
//
//  Created by Vladislav Kalaev on 04.03.17.
//  Copyright © 2017 Vladislav Kalaev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface DetailVC : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *modelField;
@property (weak, nonatomic) IBOutlet UITextField *CompanyField;

- (IBAction)saveButton:(id)sender;

@property (strong) NSManagedObject *device;

@end
