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

NS_ASSUME_NONNULL_BEGIN

@interface EmployeeListViewController : UIViewController<EmployeeListViewDelegate, UITableViewDelegate, UITableViewDataSource, AddEmployeeViewControllerDelegate>

@property (strong, nonatomic) EmployeeListView *employeeListView;
@property (copy, readwrite) NSMutableArray *employees;
- (void)loadCoreDataValues;

@end

NS_ASSUME_NONNULL_END
