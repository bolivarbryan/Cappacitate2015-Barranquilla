//
//  DetallesViewController.h
//  ParseStarterProject
//
//  Created by Bryan A Bolivar M on 4/18/15.
//
//

#import <UIKit/UIKit.h>

@interface DetallesViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imagen;


@property (weak, nonatomic) IBOutlet UILabel *nombre;
@property (weak, nonatomic) IBOutlet UIButton *telefono;
- (IBAction)llamar:(id)sender;
@property (nonatomic, weak) NSDictionary * usuario;
@end
