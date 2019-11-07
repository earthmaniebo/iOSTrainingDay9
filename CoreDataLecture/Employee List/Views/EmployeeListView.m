//
//  EmployeeListView.m
//  CoreDataLecture
//
//  Created by Earth Maniebo on 07/11/2019.
//  Copyright © 2019 Earth Maniebo. All rights reserved.
//

#import "EmployeeListView.h"

@implementation EmployeeListView

- (IBAction)segmentDidChangeValue:(id)sender {
    if (self.employeeListViewDelegate && [self.employeeListViewDelegate respondsToSelector:@selector(segmentDidChangeValue)]) {
        [self.employeeListViewDelegate segmentDidChangeValue];
    }
}

@end
