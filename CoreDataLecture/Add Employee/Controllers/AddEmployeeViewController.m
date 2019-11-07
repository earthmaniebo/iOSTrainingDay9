//
//  AddEmployeeViewController.m
//  CoreDataLecture
//
//  Created by Earth Maniebo on 07/11/2019.
//  Copyright © 2019 Earth Maniebo. All rights reserved.
//

#import "AddEmployeeViewController.h"
#import "../../AppDelegate.h"

@interface AddEmployeeViewController ()

@end

@implementation AddEmployeeViewController

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // bind custom view to controller's UIView
    self.employeeFormView = (EmployeeFormView*)[[[NSBundle mainBundle] loadNibNamed:@"EmployeeFormView" owner:self options:nil] objectAtIndex:0];
    self.employeeFormView.frame = self.view.frame;
    self.employeeFormView.employeeFormViewDelegate = self;
    [self.employeeFormView.employeeStatusView setHidden:true];
    [self.view addSubview: self.employeeFormView];
}

- (void)didTapAction {
    NSManagedObjectContext *context = [self managedObjectContext];
    NSManagedObject *employee;
    employee = [NSEntityDescription
                  insertNewObjectForEntityForName:@"Employee"
                  inManagedObjectContext:context];
    [employee setValue: self.employeeFormView.firstNameTextField.text forKey:@"firstName"];
    [employee setValue: self.employeeFormView.lastNameTextField.text forKey:@"lastName"];
    [employee setValue: self.employeeFormView.emailTextField.text forKey:@"email"];
    [employee setValue: self.employeeFormView.idNumberTextField.text forKey:@"idNumber"];
    NSDecimalNumber *salaryInDecimal = [NSDecimalNumber decimalNumberWithString:self.employeeFormView.salaryTextField.text];
    [employee setValue: salaryInDecimal forKey:@"salary"];
    [employee setValue: @1 forKey:@"isActive"];
    
    NSError *error;
    [context save:&error];
    
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    [self.navigationController popViewControllerAnimated:true];
    [self.addEmployeeViewControllerDelegate didTapSave];
}

@end
