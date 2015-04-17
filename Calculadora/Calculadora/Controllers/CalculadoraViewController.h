//
//  CalculadoraViewController.h
//  Calculadora
//
//  Created by Bryan A Bolivar M on 4/17/15.
//  Copyright (c) 2015 Cappacitate2015-Barranquilla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculadoraViewController : UIViewController{
    double primerNumero;
    double segundoNumero;
    BOOL seHizoCalculo;
    int operacionActual;
}

//Botones
@property (weak, nonatomic) IBOutlet UIButton *botonCero;
@property (weak, nonatomic) IBOutlet UIButton *botonUno;
@property (weak, nonatomic) IBOutlet UIButton *botonDos;
@property (weak, nonatomic) IBOutlet UIButton *botonTres;
@property (weak, nonatomic) IBOutlet UIButton *botonCuatro;
@property (weak, nonatomic) IBOutlet UIButton *botonCinco;
@property (weak, nonatomic) IBOutlet UIButton *botonSeis;
@property (weak, nonatomic) IBOutlet UIButton *botonSiete;
@property (weak, nonatomic) IBOutlet UIButton *botonOcho;
@property (weak, nonatomic) IBOutlet UIButton *botonNueve;
@property (weak, nonatomic) IBOutlet UILabel *resultado;

- (IBAction)agregarNumero:(UIButton *)sender;
- (IBAction)realizarOperacion:(UIButton *)sender;
- (IBAction)mostrarResultado:(id)sender;

@end
