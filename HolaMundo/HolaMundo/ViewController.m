//
//  ViewController.m
//  HolaMundo
//
//  Created by Bryan A Bolivar M on 4/17/15.
//  Copyright (c) 2015 Cappacitate2015-Barranquilla. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.nombre.text = @"Bryan";
    self.apellido.text = @"Bolivar";
    
    UILabel *telefono = [[UILabel alloc] init];
    telefono.frame = CGRectMake(10, 90, 100, 40);
    telefono.text = @"12345678";
    [self.view addSubview:telefono];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
