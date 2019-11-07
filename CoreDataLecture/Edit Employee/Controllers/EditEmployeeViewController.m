//
//  EditEmployeeViewController.m
//  CoreDataLecture
//
//  Created by Earth Maniebo on 07/11/2019.
//  Copyright © 2019 Earth Maniebo. All rights reserved.
//

#import "EditEmployeeViewController.h"

@interface EditEmployeeViewController ()

@end

@implementation EditEmployeeViewController

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
    
    self.employeeFormView = (EmployeeFormView*)[[[NSBundle mainBundle] loadNibNamed:@"EmployeeFormView" owner:self options:nil] objectAtIndex:0];
    self.employeeFormView.frame = self.view.frame;
    self.employeeFormView.employeeFormViewDelegate = self;
    [self.view addSubview: self.employeeFormView];
    [self.employeeFormView.saveButton setTitle:@"UPDATE" forState:UIControlStateNormal];
    [self loadDetails];
}

- (NSManagedObject*)getEmployee {
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Employee"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"idNumber == %@", _idNumber];
    [fetchRequest setPredicate:predicate];
    self.employees = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    NSManagedObject *employee = [self.employees objectAtIndex:0];
    return employee;
}

- (void)loadDetails {
//    NSManagedObject *employee1 = [self getEmployee];
    self.employeeFormView.firstNameTextField.text = [self.employee valueForKey:@"firstName"];
    self.employeeFormView.lastNameTextField.text = [self.employee valueForKey:@"lastName"];
    self.employeeFormView.emailTextField.text = [self.employee valueForKey:@"email"];
    self.employeeFormView.idNumberTextField.text = [self.employee valueForKey:@"idNumber"];
    NSString *salaryString = [NSString stringWithFormat:@"%@", [self.employee valueForKey:@"salary"]];
    self.employeeFormView.salaryTextField.text = salaryString;
    [self.employeeFormView.employeeStatusSwitch setOn:false];
}

- (void)didTapAction {
    NSManagedObjectContext *context = [self managedObjectContext];
    [self.employee setValue: self.employeeFormView.firstNameTextField.text forKey:@"firstName"];
    [self.employee setValue: self.employeeFormView.lastNameTextField.text forKey:@"lastName"];
    [self.employee setValue: self.employeeFormView.emailTextField.text forKey:@"email"];
    [self.employee setValue: self.employeeFormView.idNumberTextField.text forKey:@"idNumber"];
    NSDecimalNumber *salaryInDecimal = [NSDecimalNumber decimalNumberWithString:self.employeeFormView.salaryTextField.text];
    [self.employee setValue: salaryInDecimal forKey:@"salary"];
    if (self.employeeFormView.employeeStatusSwitch.isOn) {
        [self.employee setValue: @1 forKey:@"isActive"];
    } else {
        [self.employee setValue: @0 forKey:@"isActive"];
    }
    
    NSError *error;
    [context save:&error];
    
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    [self.navigationController popViewControllerAnimated:true];
    [self.editEmployeeViewControllerDelegate didTapUpdate];
}

@end
