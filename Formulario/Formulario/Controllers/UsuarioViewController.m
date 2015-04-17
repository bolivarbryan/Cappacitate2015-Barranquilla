//
//  UsuarioViewController.m
//  Formulario
//
//  Created by Bryan A Bolivar M on 4/17/15.
//  Copyright (c) 2015 Cappacitate2015-Barranquilla. All rights reserved.
//

#import "UsuarioViewController.h"
#import "Usuario.h"

@interface UsuarioViewController ()

@end

@implementation UsuarioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

//[self.nombreTextField.text isEqualToString:@""]

// ||UTILICEN GITHUB, les dara credibilidad a su proyecto y podre hacerles seguimientos





- (IBAction)revisarFormulario:(UITextField *)sender {
    
    if ([self.nombreTextField.text isEqualToString:@""] || [self.apellidoTextField.text isEqualToString:@""] || [self.telefono.text isEqualToString:@""]){
        self.botonGuardar.enabled = NO;
    }else{
        self.botonGuardar.enabled = YES;
    }
}
-(void)mostrarEnAlerta:(Usuario *)sender{
    [[[UIAlertView alloc] initWithTitle:@"Formulario" message:[NSString stringWithFormat:@"El usuario %@ %@ ha sido creado y su numero de telefono es %@", sender.nombre , sender.apellido, sender.telefono] delegate:self cancelButtonTitle:@"Yahoo!" otherButtonTitles: nil] show];
}

- (IBAction)guardar:(id)sender {
    
    [self.nombreTextField resignFirstResponder];
    [self.apellidoTextField resignFirstResponder];
    [self.telefono resignFirstResponder];
    
    Usuario * user = [[Usuario alloc] init];
    user.nombre = self.nombreTextField.text;
    user.apellido = self.apellidoTextField.text;
    user.telefono = [NSNumber numberWithInt:[self.telefono.text intValue]];
    
    UILabel *resultadoLbl = [[UILabel alloc] init];
    resultadoLbl.text = [NSString stringWithFormat:@"El usuario %@ %@ ha sido creado y su numero de telefono es %@", user.nombre , user.apellido, user.telefono];
    
    resultadoLbl.font = [UIFont fontWithName:@"Helvetica" size:20.0f];
    [resultadoLbl setFrame:CGRectMake(20, 420, 300, 60)];
    resultadoLbl.numberOfLines = 2;
    [self.view addSubview:resultadoLbl];
    
    [self mostrarEnAlerta:user];
    // el ususario x, y ha sido creado. y cuyo telefono es z.
}
@end
