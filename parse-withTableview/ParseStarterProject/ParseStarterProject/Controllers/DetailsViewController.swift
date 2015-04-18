//
//  DetailsViewController.swift
//  ParseStarterProject
//
//  Created by Bryan A Bolivar M on 4/18/15.
//
//

import UIKit

class DetailsViewController: UIViewController {
   // MARK: - Variables
    var usuario: Usuario!
    var tempUsuario: NSDictionary!
    @IBOutlet weak var nombre: UILabel!

    
    @IBAction func llamar(sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        nombre.text = usuario.nombre
        nombre.text = tempUsuario.objectForKey("nombre") as? String
        
        let array: NSArray = ["", "", ""]
        let array2 = []
        

        var label: UILabel = UILabel(frame: CGRectMake(0, 0, 100, 100))
        label.text = "Hola Mundo"
        label.font = UIFont(name: "Helvetica", size: 20)
        self.view.addSubview(label)
        
        
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
