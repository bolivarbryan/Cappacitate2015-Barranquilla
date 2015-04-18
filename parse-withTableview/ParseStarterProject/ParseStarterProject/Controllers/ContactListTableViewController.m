//
//  ContactListTableViewController.m
//  ParseStarterProject
//
//  Created by Bryan A Bolivar M on 4/18/15.
//
//

#import "ContactListTableViewController.h"
#import <Parse/Parse.h>

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

}

-(void)obtenerContactos{
    arregloDinamico = [[NSMutableArray alloc] init];
    arreglo = @[@"grupo numero 1" , @"grupo numero 2"];
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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContactCellIdentifier" forIndexPath:indexPath];
    if (indexPath.section == 0){
        PFObject * usuario = [arregloDinamico objectAtIndex:indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", [usuario objectForKey:@"nombre"],[usuario objectForKey:@"apellido"]];
    }else{
        cell.textLabel.text = @"grupo 2";
    }
    
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
