//
//  LeaveEntriesDisplayViewController.m
//  LeaveApplication
//
//  Created by Anshad M K on 03/10/17.
//  Copyright © 2017 Anshad M K. All rights reserved.
//

#import "LeaveEntriesDisplayViewController.h"
#import "LeaveItemCell.h"
#import "LeaveEntriesDisplayInteractor.h"
#import "LeaveApplicationEditViewController.h"

@interface LeaveEntriesDisplayViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *leaveEntriesTableView;
@property (nonatomic, strong) LeaveEntriesDisplayInteractor *interactor;
@property (nonatomic, strong) UIBarButtonItem *addLeaveButton;
@end

@implementation LeaveEntriesDisplayViewController
- (void)loadView{
    [super loadView];
    [self.view addSubview:self.leaveEntriesTableView];
    [self.leaveEntriesTableView autoPinEdgesToSuperviewEdges];
    self.navigationItem.rightBarButtonItem = self.addLeaveButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Getteres

- (UIBarButtonItem *)addLeaveButton{
    
    if(!_addLeaveButton){
        
        _addLeaveButton = [[UIBarButtonItem alloc] initWithTitle:@"Add"style:UIBarButtonItemStylePlain
                                                          target:self
                                                          action:@selector(didClickAddButton:)];
    }return _addLeaveButton;
}

- (LeaveEntriesDisplayInteractor *)interactor{
    if(!_interactor){
        
        _interactor = [LeaveEntriesDisplayInteractor new];
    }return _interactor;
}

- (UITableView *)leaveEntriesTableView{
    
    if(!_leaveEntriesTableView){
        
        _leaveEntriesTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _leaveEntriesTableView.translatesAutoresizingMaskIntoConstraints = NO;
        _leaveEntriesTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _leaveEntriesTableView.dataSource = self;
        _leaveEntriesTableView.delegate = self;
        _leaveEntriesTableView.backgroundColor = [UIColor darkGrayColor];
        [_leaveEntriesTableView registerClass:[LeaveItemCell class] forCellReuseIdentifier:@"Cell"];
        
    }return _leaveEntriesTableView;    
}

#pragma mark - Button events

- (void)didClickAddButton:(id)sender{
    
    LeaveApplicationEditViewController *controller = [LeaveApplicationEditViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - tableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.interactor.employeeLeaveEntries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LeaveItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.viewModel = [self.interactor.employeeLeaveEntries objectAtIndex:indexPath.row];
    [cell reloadData];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80.0f;
}
@end
