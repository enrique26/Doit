//
//  ViewController.swift
//  Doit
//
//  Created by Enrique Gachuz on 04/01/18.
//  Copyright © 2018 Enrique Gachuz. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var tableViewOne: UITableView!
    var tasks:[Task] = [];
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //first calle the function before create tableview
        tasks=makeTask();
        
        tableViewOne.dataSource=self;
        tableViewOne.delegate=self;
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=UITableViewCell()
        let task=tasks[indexPath.row];
        if(task.importat==true){
            cell.textLabel?.text="❗️\(task.name)"
        }else{
            cell.textLabel?.text=task.name
        }
        
        return cell;
    }

    func makeTask()->[Task]{
        let task1=Task();
        task1.name="walk";
        task1.importat=false;
        
        let task2=Task();
        task2.name="walk 2";
        task2.importat=false;
        
        let task3=Task();
        task3.name="buy";
        task3.importat=true;
        
        return [task1,task2,task3]
    }
    
    @IBAction func makeAdd(_ sender: Any) {
        performSegue(withIdentifier: "addScreen", sender: nil)
    }
    
}

