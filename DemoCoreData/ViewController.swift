//
//  ViewController.swift
//  DemoCoreData
//
//  Created by Leonardo on 11/21/18.
//  Copyright © 2018 Leonardo. All rights reserved.
//


import UIKit

var tasks = [String]()

class ViewController: UIViewController, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addTask(sender: AnyObject){
        let alert = UIAlertController(title: "Nueva Tarea",
                                      message: "Añade una nueva tarea",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Guardar",
                                       style: .default,
                                       handler: { (action:UIAlertAction) -> Void in
                                        
                                        let textField = alert.textFields!.first
                                        tasks.append(textField!.text!)
                                        self.tableView.reloadData()
        })
        
        let cancelAction = UIAlertAction(title: "Cancelar",
                                         style: .default) { (action: UIAlertAction) -> Void in
        }
        
        alert.addTextField {
            (textField: UITextField) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert,
                animated: true,
                completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell =
            tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell!.textLabel!.text = tasks[indexPath.row]
        
        return cell!
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}


