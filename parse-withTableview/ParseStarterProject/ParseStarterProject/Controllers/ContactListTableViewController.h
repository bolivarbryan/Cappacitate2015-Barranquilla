//
//  ContactListTableViewController.h
//  ParseStarterProject
//
//  Created by Bryan A Bolivar M on 4/18/15.
//
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ContactListTableViewController : UITableViewController{
    NSArray *arreglo;
    NSMutableArray *arregloDinamico;
    NSDictionary * usuarioSeleccionado;
    PFObject * usuarioSeleccionadoComoPFObject;
}

@end
