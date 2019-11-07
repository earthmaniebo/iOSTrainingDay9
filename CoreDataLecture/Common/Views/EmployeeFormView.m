//
//  EmployeeFormView.m
//  CoreDataLecture
//
//  Created by Earth Maniebo on 07/11/2019.
//  Copyright © 2019 Earth Maniebo. All rights reserved.
//

#import "EmployeeFormView.h"

@implementation EmployeeFormView

- (IBAction)didTapAction:(id)sender {
    if (self.employeeFormViewDelegate && [self.employeeFormViewDelegate respondsToSelector:@selector(didTapAction)]) {
        [self.employeeFormViewDelegate didTapAction];
    }
}

@end
