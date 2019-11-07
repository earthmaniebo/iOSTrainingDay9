//
//  EditEmployeeViewController.h
//  CoreDataLecture
//
//  Created by Earth Maniebo on 07/11/2019.
//  Copyright © 2019 Earth Maniebo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../../Common/Views/EmployeeFormView.h"

NS_ASSUME_NONNULL_BEGIN

@interface EditEmployeeViewController : UIViewController<EmployeeFormViewDelegate>

@property (strong, nonatomic) EmployeeFormView *employeeFormView;

@end

NS_ASSUME_NONNULL_END
