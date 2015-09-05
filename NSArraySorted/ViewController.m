//
//  ViewController.m
//  NSArraySorted
//
//  Created by Dong Nguyen Duc on 9/5/15.
//  Copyright (c) 2015 Dong Nguyen Duc. All rights reserved.
//

#import "ViewController.h"

@interface Person()
@property (nonatomic ,strong) NSString *name;
@end
@implementation Person

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)tapButtonArraySort:(id)sender{
    NSArray *names = @[ @"Phuong", @"ABC", @"Teo", @"Minh" ,@"Dong"];
    NSMutableArray *people = [NSMutableArray array];
    NSSortDescriptor *sortDescription = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    [names enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        Person *person = [[Person alloc]init];
        person.name = [names objectAtIndex:idx];
        [people addObject:person];
    }];
    
    NSArray *peopleSort = [people sortedArrayUsingDescriptors:@[sortDescription]];
    for (Person *obj in peopleSort) {
        NSLog(@"ten: %@",obj.name);
    }

}


@end
