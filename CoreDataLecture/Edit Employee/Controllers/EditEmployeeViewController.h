//
//  EditEmployeeViewController.h
//  CoreDataLecture
//
//  Created by Earth Maniebo on 07/11/2019.
//  Copyright © 2019 Earth Maniebo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../../Common/Views/EmployeeFormView.h"
#import "../../AppDelegate.h"

@protocol EditEmployeeViewControllerDelegate <NSObject>
@required
- (void)didTapUpdate;
@end

NS_ASSUME_NONNULL_BEGIN

@interface EditEmployeeViewController : UIViewController<EmployeeFormViewDelegate>

@property (strong, nonatomic) EmployeeFormView *employeeFormView;
@property (copy) NSString *idNumber;
@property (copy, readwrite) NSMutableArray *employees;
- (NSManagedObject*)getEmployee;
@property (strong) NSManagedObject *employee;
- (void)loadDetails;
@property (weak, nonatomic) id <EditEmployeeViewControllerDelegate> editEmployeeViewControllerDelegate;

@end

NS_ASSUME_NONNULL_END
