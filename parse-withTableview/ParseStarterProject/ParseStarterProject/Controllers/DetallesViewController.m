//
//  DetallesViewController.m
//  ParseStarterProject
//
//  Created by Bryan A Bolivar M on 4/18/15.
//
//

#import "DetallesViewController.h"

@interface DetallesViewController ()

@end

@implementation DetallesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", self.usuario);
    self.nombre.text = [self.usuario objectForKey:@"nombre"];
    //self.imagen.image = [UIImage imageNamed:@"bryan"];

    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: @"https://pbs.twimg.com/profile_images/588941692939718656/RVOEES2C_400x400.jpg"]];
        if ( imageData == nil )
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            // WARNING: is the cell still using the same data by this point??
            self.imagen.image = [UIImage imageWithData: imageData];
        });
    });



    
    
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

- (IBAction)llamar:(id)sender {
    PFObject *telefono = [PFObject objectWithClassName:@"Telefono"];
    telefono[@"numero"] = @"323123";
    telefono[@"tipo"] = @"fijo";
    telefono[@"owner"] = self.usuarioActualizar;
    [telefono saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // The object has been saved.
            
        } else {
            // There was a problem, check error.description
        }
    }];
}
@end
