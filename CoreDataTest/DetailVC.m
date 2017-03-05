//
//  DetailVC.m
//  CoreDataTest
//
//  Created by Vladislav Kalaev on 04.03.17.
//  Copyright © 2017 Vladislav Kalaev. All rights reserved.
//

#import "DetailVC.h"

@interface DetailVC ()

@end

@implementation DetailVC

@synthesize device;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.device) {
        [self.nameField setText:[self.device valueForKey:@"name"]];
        [self.modelField setText:[self.device valueForKey:@"version"]];
        [self.CompanyField setText:[self.device valueForKey:@"company"]];
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSManagedObjectContext*)managedObjectContext {
    
    NSManagedObjectContext *context = nil;
    
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}


- (IBAction)saveButton:(id)sender {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (self.device){
    
        [self.device setValue:self.nameField.text forKey:@"name"];
        [self.device setValue:self.modelField.text forKey:@"version"];
        [self.device setValue:self.CompanyField.text forKey:@"company"];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"УРА!" message:@"Успешно изменено" delegate:self cancelButtonTitle:@"ОК" otherButtonTitles:nil, nil];
        [alert show];
        
    }else {
    NSManagedObject *newDvice = [NSEntityDescription insertNewObjectForEntityForName:@"Device" inManagedObjectContext:context];
    [newDvice setValue:self.nameField.text forKey:@"name"];
    [newDvice setValue:self.modelField.text forKey:@"version"];
    [newDvice setValue:self.CompanyField.text forKey:@"company"];

    NSError *error = nil;
    
    if (![context save:&error]) {
        NSLog(@"Can't save: %@ || %@", error, [error localizedDescription]);
    }else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"УРА!" message:@"Успешно добавлено" delegate:self cancelButtonTitle:@"ОК" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    }
    
}


@end
