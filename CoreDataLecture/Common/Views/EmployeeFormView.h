//
//  EmployeeFormView.h
//  CoreDataLecture
//
//  Created by Earth Maniebo on 07/11/2019.
//  Copyright © 2019 Earth Maniebo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EmployeeFormViewDelegate <NSObject>
@required
- (void)didTapAction;
@end

NS_ASSUME_NONNULL_BEGIN

@interface EmployeeFormView : UIView

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *idNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *salaryTextField;
@property (weak, nonatomic) IBOutlet UISwitch *employeeStatusSwitch;
@property (weak, nonatomic) IBOutlet UIView *employeeStatusView;
@property (weak, nonatomic) id <EmployeeFormViewDelegate> employeeFormViewDelegate;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@end

NS_ASSUME_NONNULL_END
