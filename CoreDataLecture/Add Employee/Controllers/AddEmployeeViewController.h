//
//  AddEmployeeViewController.h
//  CoreDataLecture
//
//  Created by Earth Maniebo on 07/11/2019.
//  Copyright © 2019 Earth Maniebo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../../Common/Views/EmployeeFormView.h"

@protocol AddEmployeeViewControllerDelegate <NSObject>
@required
- (void)didTapSave;
@end

NS_ASSUME_NONNULL_BEGIN

@interface AddEmployeeViewController : UIViewController<EmployeeFormViewDelegate>

@property (strong, nonatomic) EmployeeFormView *employeeFormView;
@property (weak, nonatomic) id <AddEmployeeViewControllerDelegate> addEmployeeViewControllerDelegate;

@end

NS_ASSUME_NONNULL_END
