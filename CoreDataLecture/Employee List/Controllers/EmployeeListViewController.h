//
//  EmployeeListViewController.h
//  CoreDataLecture
//
//  Created by Earth Maniebo on 07/11/2019.
//  Copyright © 2019 Earth Maniebo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Views/EmployeeListView.h"
#import "../Views/Cells/EmployeeTableViewCell.h"
#import "../../Add Employee/Controllers/AddEmployeeViewController.h"
#import "../../Edit Employee/Controllers/EditEmployeeViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface EmployeeListViewController : UIViewController<EmployeeListViewDelegate, UITableViewDelegate, UITableViewDataSource, AddEmployeeViewControllerDelegate, EditEmployeeViewControllerDelegate>

@property (strong, nonatomic) EmployeeListView *employeeListView;
@property (copy, readwrite) NSMutableArray *employees;
@property (copy) NSString *idNumber;
- (void)loadCoreDataValues;
@property (strong) NSManagedObject *employee;

@end

NS_ASSUME_NONNULL_END
