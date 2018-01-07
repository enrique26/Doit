//
//  TaskViewController.swift
//  Doit
//
//  Created by Enrique Gachuz on 04/01/18.
//  Copyright © 2018 Enrique Gachuz. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var tableViewOne: UITableView!
    var tasks:[Task] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        tableViewOne.dataSource=self;
        tableViewOne.delegate=self;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTask()
        tableViewOne.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task=tasks[indexPath.row];
        performSegue(withIdentifier: "selectTask", sender: task);
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=UITableViewCell();
        let task=tasks[indexPath.row];
        if(task.important==true){
            cell.textLabel?.text="❗️\(task.name!)";
        }else{
            cell.textLabel?.text=task.name!;
        }
        
        return cell;
    }

//    func makeTask()->[Task]{
//        let task1=Task();
//        task1.name="walk";
//        task1.importat=false;
//
//        let task2=Task();
//        task2.name="walk 2";
//        task2.importat=false;
//
//        let task3=Task();
//        task3.name="buy";
//        task3.importat=true;
//
//        return [task1,task2,task3];
//    }
    
    @IBAction func makeAdd(_ sender: Any) {
        performSegue(withIdentifier: "addScreen", sender: nil);
    }
    
    func getTask() {
        let context=(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            tasks = try context.fetch(Task.fetchRequest()) as![Task]
            print(tasks)
        }catch{
            print("Error on fetch Task data")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "selectTask") {
            let nextVC=segue.destination as! CompleteTaskViewController;
            nextVC.task=sender as? Task;
        }

    }

    
}

