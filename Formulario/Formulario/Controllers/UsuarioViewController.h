//
//  UsuarioViewController.h
//  Formulario
//
//  Created by Bryan A Bolivar M on 4/17/15.
//  Copyright (c) 2015 Cappacitate2015-Barranquilla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UsuarioViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nombreTextField;
@property (weak, nonatomic) IBOutlet UITextField *apellidoTextField;
@property (weak, nonatomic) IBOutlet UITextField *telefono;

- (IBAction)revisarFormulario:(UITextField *)sender;

@property (weak, nonatomic) IBOutlet UIButton *botonGuardar;

- (IBAction)guardar:(id)sender;

@end
