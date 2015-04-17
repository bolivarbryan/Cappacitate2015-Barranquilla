//
//  CalculadoraViewController.m
//  Calculadora
//
//  Created by Bryan A Bolivar M on 4/17/15.
//  Copyright (c) 2015 Cappacitate2015-Barranquilla. All rights reserved.
//

#import "CalculadoraViewController.h"

@interface CalculadoraViewController ()

@end

@implementation CalculadoraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    primerNumero = 0;
    segundoNumero = 0;
    seHizoCalculo = NO;
    operacionActual = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)agregarNumero:(UIButton *)sender {
    if (seHizoCalculo){
        primerNumero = 0;
        segundoNumero = 0;
        self.resultado.text = @"0";
        seHizoCalculo = NO;
        operacionActual = 0;
    }
    if ([self.resultado.text isEqualToString: @"0"]){
        self.resultado.text = sender.titleLabel.text;
    }else{
        self.resultado.text = [self.resultado.text stringByAppendingString:sender.titleLabel.text];
    }
}

- (IBAction)realizarOperacion:(UIButton *)sender {
    operacionActual = sender.tag;
    if (primerNumero == 0) {
        primerNumero = [self.resultado.text doubleValue];
        self.resultado.text = @"0";
    }else{
    switch (sender.tag) {
        case 1:
            NSLog(@"division");
            break;
        case 2:
            NSLog(@"multiplicacion");
            break;
        case 3:
            NSLog(@"resta");
            break;
        case 4:
            NSLog(@"suma");
               segundoNumero = primerNumero + [self.resultado.text doubleValue];
                self.resultado.text = [NSString stringWithFormat:@"%@", [NSNumber numberWithDouble:segundoNumero]];
            seHizoCalculo = YES;
            break; 
        default:
            break;
        }
    }
}

- (IBAction)mostrarResultado:(id)sender {
    UIButton *buttonWithTag = [[UIButton alloc] init];
    buttonWithTag.tag = operacionActual;
    [self realizarOperacion:buttonWithTag];
}


@end
