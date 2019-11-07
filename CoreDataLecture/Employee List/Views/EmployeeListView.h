//
//  EmployeeListView.h
//  CoreDataLecture
//
//  Created by Earth Maniebo on 07/11/2019.
//  Copyright © 2019 Earth Maniebo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EmployeeListViewDelegate <NSObject>
@required
- (void)segmentDidChangeValue;
@end

NS_ASSUME_NONNULL_BEGIN

@interface EmployeeListView : UIView

@property (weak, nonatomic) IBOutlet UISegmentedControl *employeeStatusSegmentedControl;
@property (weak, nonatomic) IBOutlet UITableView *employeeTableView;
@property (weak, nonatomic) id <EmployeeListViewDelegate> employeeListViewDelegate;

@end

NS_ASSUME_NONNULL_END
