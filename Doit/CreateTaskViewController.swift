//
//  CreateTaskViewController.swift
//  Doit
//
//  Created by Enrique Gachuz on 04/01/18.
//  Copyright © 2018 Enrique Gachuz. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet var taskNameField: UITextField!
    @IBOutlet var importatnSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButton(_ sender: Any) {
        
        let context=(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //create task
        let task=Task(context: context)
        task.name=taskNameField.text!;
        task.important=importatnSwitch.isOn;
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        //back to the previous viewcontroller navigation
        navigationController?.popViewController(animated: true);
        
    }


}
