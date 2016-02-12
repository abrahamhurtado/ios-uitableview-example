//
//  TableViewController.swift
//  iOSPrueba
//
//  Created by Abraham on 11/02/16.
//  Copyright © 2016 Abraham. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var nombresAmigos = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nombresAmigos.append("Diego Ríos")
        nombresAmigos.append("Eunice Padilla")
        nombresAmigos.append("Rolando Valenzuela")
        nombresAmigos.append("Ramón Ramírez")
        nombresAmigos.append("Javier Salazar")
        nombresAmigos.append("Kenya Pablos")
        nombresAmigos.append("Germán Verdugo")
        nombresAmigos.append("Gerardo Sánchez")
        nombresAmigos.append("Tomás Ibarra")
        nombresAmigos.append("Luis Hernández")
        nombresAmigos.append("Diego Hurtado")
        nombresAmigos.append("Jonathan Hernández")
        tableView.setEditing(true, animated: true)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch (indexPath.section) {
            case 0:
                return 40
            case 1:
                return 80
            default:
                return 40
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nombresAmigos.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Se hizo clic a la sección \(indexPath.section), en el elemento \(indexPath.row)")
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch (indexPath.section) {
            case 0:
                let cell = self.tableView.dequeueReusableCellWithIdentifier("nombresCell", forIndexPath: indexPath) as! TableViewCell
                let row = indexPath.row
                
                cell.nombresLabel.text = nombresAmigos[row]
                
                return cell
            case 1:
                let cell = self.tableView.dequeueReusableCellWithIdentifier("secondCell", forIndexPath: indexPath) as! SecondTableViewCell
                let row = indexPath.row
                
                cell.subtituloLabel.text = "Te agregó"
                cell.nombresLabel.text = nombresAmigos[row]
                
                return cell
            default: return UITableViewCell()
        }
        
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch (section) {
            case 0: return "Mis amigos"
            case 1: return "Mis amigos recientes"
            default: return "ÑO"
        }
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        nombresAmigos.removeAtIndex(indexPath.row)
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let amigoMovido = nombresAmigos[destinationIndexPath.row]
        let amigoReemplazado = nombresAmigos[sourceIndexPath.row]
        
        nombresAmigos.removeAtIndex(destinationIndexPath.row)
        nombresAmigos.insert(amigoReemplazado, atIndex: destinationIndexPath.row)
        nombresAmigos.removeAtIndex(sourceIndexPath.row)
        nombresAmigos.insert(amigoMovido, atIndex: sourceIndexPath.row)
        
        self.tableView.reloadData()
    }
}
