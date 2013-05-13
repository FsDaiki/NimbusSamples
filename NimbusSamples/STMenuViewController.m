//
//  STViewController.m
//  NimbusSamples
//
//  Created by EIMEI on 2013/05/13.
//  Copyright (c) 2013 stack3.net. All rights reserved.
//

#import "STMenuViewController.h"
#import "STMenuSection.h"
#import "STMenuRow.h"
#import "STPagingScrollViewSampleViewController.h"

@implementation STMenuViewController {
    __weak UITableView *_tableView;
    __strong NSMutableArray *_sections;
}

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.title = @"Nimbus Samples";
        
        _sections = [NSMutableArray arrayWithCapacity:10];

        STMenuSection *menuSection;
        STMenuRow *menuRow;
        
        menuSection = [[STMenuSection alloc] init];
        menuSection.title = @"PagingScrollView";
        
        menuRow = [[STMenuRow alloc] init];
        menuRow.title = @"NIPagingScrollView";
        menuRow.viewControllerClass = [STPagingScrollViewSampleViewController class];
        
        [menuSection.rows addObject:menuRow];
        [_sections addObject:menuSection];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect bounds = self.view.bounds;
    UITableView *tableView = [[UITableView alloc] initWithFrame:bounds style:UITableViewStylePlain];
    _tableView = tableView;
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:tableView];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [_tableView deselectRowAtIndexPath:[_tableView indexPathForSelectedRow] animated:YES];
}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    STMenuSection *menuSection = [_sections objectAtIndex:section];
    return menuSection.rows.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    STMenuSection *menuSection = [_sections objectAtIndex:section];
    return menuSection.title;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    STMenuSection *section = [_sections objectAtIndex:indexPath.section];
    STMenuRow *row = [section.rows objectAtIndex:indexPath.row];
    
    cell.textLabel.text = row.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    STMenuSection *section = [_sections objectAtIndex:indexPath.section];
    STMenuRow *row = [section.rows objectAtIndex:indexPath.row];

    UIViewController *con = [[row.viewControllerClass alloc] init];
    [self.navigationController pushViewController:con animated:YES];
}

@end
