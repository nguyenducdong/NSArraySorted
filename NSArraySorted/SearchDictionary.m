//
//  SearchDictionary.m
//  NSArraySorted
//
//  Created by Dong Nguyen Duc on 9/5/15.
//  Copyright (c) 2015 Dong Nguyen Duc. All rights reserved.
//

#import "SearchDictionary.h"

@interface SearchDictionary()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UITextField *textfield;
@end

@implementation SearchDictionary{
    NSDictionary *dicData;
    NSArray *arrayData;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    NSArray *arrayKeyA = @[@"An",@"Anh",@"Animal",@"Apple",@"Air"];
    NSArray *arrayKeyB = @[@"Bao",@"Binh",@"Bum",@"Beo",@"Ba"];
    NSArray *arrayKeyC = @[@"Con",@"Cao",@"Ca",@"Coas",@"Cocacola"];
    NSArray *arrayKeyD = @[@"Danh",@"Dao",@"Dai",@"Doa",@"Daao"];
    NSArray *arrayKeyE = @[@"Eo",@"Em yeu",@"Ep buoi",@"Ep nho",@"E teo"];
    dicData = @{@"a": arrayKeyA,
                              @"b": arrayKeyB,
                              @"c": arrayKeyC,
                              @"d": arrayKeyD,
                              @"e": arrayKeyE,};
}


#pragma mark - private method
-(void)searchKeyWordWith: (NSString *)keyword{
    if (!keyword || keyword.length == 0) {
        return;
    }
    NSString *key = [keyword substringToIndex:1];
    if ([[dicData allKeys]containsObject:key]) {
        arrayData = dicData[key];
    }
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@",keyword];
    arrayData = [arrayData filteredArrayUsingPredicate:predicate];
    [self.tableView reloadData];
}

#pragma mark - action method
-(IBAction)tapButtonSearch:(id)sender{
    [self searchKeyWordWith:self.textfield.text];
}

-(IBAction)tapButtonClose:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arrayData.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifer"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifer"];
    }
    cell.textLabel.text = arrayData[indexPath.row];
    
    return cell;
}

@end
