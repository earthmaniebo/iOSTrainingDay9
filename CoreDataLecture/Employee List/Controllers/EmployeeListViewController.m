//
//  EmployeeListViewController.m
//  CoreDataLecture
//
//  Created by Earth Maniebo on 07/11/2019.
//  Copyright © 2019 Earth Maniebo. All rights reserved.
//

#import "EmployeeListViewController.h"
#import "../../AppDelegate.h"

@interface EmployeeListViewController ()

@end

@implementation EmployeeListViewController

- (IBAction)didTapAdd:(id)sender {
    [self performSegueWithIdentifier:@"addSegue" sender:self];
}

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // bind custom view to controller's UIView
    self.employeeListView = (EmployeeListView*)[[[NSBundle mainBundle] loadNibNamed:@"EmployeeListView" owner:self options:nil] objectAtIndex:0];
    self.employeeListView.frame = self.view.frame;
    self.employeeListView.employeeListViewDelegate = self;
    [self.view addSubview: self.employeeListView];
    
    // table view setup
    [self.employeeListView.employeeTableView registerNib:[UINib nibWithNibName:@"EmployeeTableViewCell" bundle:nil] forCellReuseIdentifier:@"EmployeeCell"];
    self.employeeListView.employeeTableView.delegate = self;
    self.employeeListView.employeeTableView.dataSource = self;
    [self loadCoreDataValues];
}


- (void)loadCoreDataValues {
    // Fetch the devices from persistent data store
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Employee"];
    self.employees = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    [self.employeeListView.employeeTableView reloadData];
    NSLog(@"load core data values");
}

- (void)segmentDidChangeValue {
    if (self.employeeListView.employeeStatusSegmentedControl.selectedSegmentIndex == 0) {
        NSLog(@"All");
    } else if (self.employeeListView.employeeStatusSegmentedControl.selectedSegmentIndex == 1) {
        NSLog(@"Active");
    } else if (self.employeeListView.employeeStatusSegmentedControl.selectedSegmentIndex == 2) {
        NSLog(@"Resigned");
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"addSegue"]) {
        AddEmployeeViewController *vc = [segue destinationViewController];
        vc.addEmployeeViewControllerDelegate = self;
    } else if ([segue.identifier isEqualToString:@"editSegue"]) {
        EditEmployeeViewController *vc = [segue destinationViewController];
        vc.idNumber = _idNumber;
        vc.employee = self.employee;
        vc.editEmployeeViewControllerDelegate = self;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.employees count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EmployeeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EmployeeCell"];
    NSManagedObject *employee = [self.employees objectAtIndex:indexPath.row];
    cell.employeeNameLabel.text = [NSString stringWithFormat:@"%@ %@", [employee valueForKey:@"firstName"], [employee valueForKey:@"lastName"]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSManagedObject *employee = [self.employees objectAtIndex:indexPath.row];
    self.employee = employee;
    [self performSegueWithIdentifier:@"editSegue" sender:self];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return true;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete object from database
        [context deleteObject:[self.employees objectAtIndex:indexPath.row]];
        
        NSError *error = nil;
        if (![context save:&error]) {
            NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
            return;
        }
        NSMutableArray *tempMArray = [NSMutableArray arrayWithArray:self.employees];
        [tempMArray removeObjectAtIndex:indexPath.row];
        self.employees = tempMArray;
        [self.employeeListView.employeeTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (void)didTapSave {
    [self loadCoreDataValues];
}

-(void)didTapUpdate {
    [self loadCoreDataValues];
}

@end
