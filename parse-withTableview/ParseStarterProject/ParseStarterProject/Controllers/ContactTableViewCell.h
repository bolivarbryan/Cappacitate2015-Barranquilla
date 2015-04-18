//
//  ContactTableViewCell.h
//  ParseStarterProject
//
//  Created by Bryan A Bolivar M on 4/18/15.
//
//

#import <UIKit/UIKit.h>

@interface ContactTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nombre;
@property (weak, nonatomic) IBOutlet UIButton *telefono;
-(IBAction)llamarContacto:(UIButton *)sender;
@end
