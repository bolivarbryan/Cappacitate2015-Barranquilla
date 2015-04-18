//
//  ContactListTableViewController.m
//  ParseStarterProject
//
//  Created by Bryan A Bolivar M on 4/18/15.
//
//

#import "ContactListTableViewController.h"
#import <Parse/Parse.h>
#import "ContactTableViewCell.h"
#import "DetallesViewController.h"

@interface ContactListTableViewController ()

@end

@implementation ContactListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self obtenerContactos];
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.backgroundColor = [UIColor purpleColor];
    self.refreshControl.tintColor = [UIColor whiteColor];
    [self.refreshControl addTarget:self
                            action:@selector(obtenerContactos)
                  forControlEvents:UIControlEventValueChanged];

    NSDictionary *dict = @{@"nombre":@"bryan", @"apellido":@"bolivar"};
}

-(void)obtenerContactos{
    arregloDinamico = [[NSMutableArray alloc] init];
    arreglo = @[@"grupo numero 1"];
    PFQuery *consulta = [PFQuery queryWithClassName:@"Usuario"];
    [consulta findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            NSMutableArray * tmpArray = [[NSMutableArray alloc] init];
            tmpArray =[NSMutableArray arrayWithArray:objects];
            arregloDinamico  = tmpArray;
            tmpArray = nil;
            [self.tableView reloadData];
            [self.refreshControl endRefreshing];
        } else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Bryan Methods
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * vistaHeader = [[UIView alloc] init];
    vistaHeader.frame = CGRectMake(0, 0, self.tableView.frame.size.width, 40);
    vistaHeader.backgroundColor = [UIColor colorWithRed:61.0f/255 green:150.0f/255 blue:200.0f/255 alpha:1];
    
    UILabel * titulo = [[UILabel alloc] init];
    titulo.frame = CGRectMake(0, 0, self.tableView.frame.size.width, 40);
    titulo.textColor = [UIColor whiteColor];
    
    if ([arreglo[section] isKindOfClass:[NSString class]]) {
        titulo.text = [NSString stringWithFormat:@"%@", arreglo[section]];

    }
    [vistaHeader addSubview:titulo];
    return vistaHeader;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return arreglo.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0){
        return arregloDinamico.count;
    }else{
        return 6;
    }
    
}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 92.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PFObject * usuario = [arregloDinamico objectAtIndex:indexPath.row];
    
    ContactTableViewCell *cell = (ContactTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"CustomContactCellIdentifier"];
    
    cell.nombre.text = [NSString stringWithFormat:@"%@ %@", [usuario objectForKey:@"nombre"],[usuario objectForKey:@"apellido"]];
    
    [cell.telefono setTitle:[usuario objectForKey:@"telefono"] forState:UIControlStateNormal];
    
    [cell.telefono setTitle:@"Llamando"forState:UIControlStateSelected];
    [cell.telefono setTitle:@"Manten presionado para llamar" forState:UIControlStateHighlighted];
    

    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContactCellIdentifier" forIndexPath:indexPath];
    
    /*
    if (indexPath.section == 0){
        PFObject * usuario = [arregloDinamico objectAtIndex:indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", [usuario objectForKey:@"nombre"],[usuario objectForKey:@"apellido"]];
    }else{
        cell.textLabel.text = @"grupo 2";
    }
    
   */
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    usuarioSeleccionado = (NSDictionary *)[arregloDinamico objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"DetailsSegue" sender:self];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
 
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"DetailsSegue"]){
        DetallesViewController *vc = [segue destinationViewController];
        vc.usuario = usuarioSeleccionado;
    }
}


@end
