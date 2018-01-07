//
//  CompleteTaskViewController.swift
//  Doit
//
//  Created by Enrique Gachuz on 04/01/18.
//  Copyright © 2018 Enrique Gachuz. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

    var task : Task? = nil;
    
    
    @IBOutlet var taskLabel: UILabel!
    
    @IBAction func completeTapped(_ sender: Any) {
        let context=(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        //borrar tarea task del core data
        context.delete(task!)
        
        //salvar el contexto para asegurarnos de que el borrado paso
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController?.popViewController(animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if(task!.important==true){
            taskLabel?.text="❗️\(task!.name!)";
        }else{
            taskLabel?.text=task!.name!;
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
