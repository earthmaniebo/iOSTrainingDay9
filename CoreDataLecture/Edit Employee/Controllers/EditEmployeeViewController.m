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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.employeeFormView = (EmployeeFormView*)[[[NSBundle mainBundle] loadNibNamed:@"EmployeeFormView" owner:self options:nil] objectAtIndex:0];
    self.employeeFormView.frame = self.view.frame;
    self.employeeFormView.employeeFormViewDelegate = self;
    [self.view addSubview: self.employeeFormView];
    [self.employeeFormView.saveButton setTitle:@"UPDATE" forState:UIControlStateNormal];
}

- (void)didTapAction {
    
}

@end
