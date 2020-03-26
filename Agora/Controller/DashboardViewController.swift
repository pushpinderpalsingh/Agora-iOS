//
//  ViewController.swift
//  Agora
//
//  Created by Pushpinder Pal Singh on 24/03/20.
//  Copyright © 2020 Pushpinder Pal Singh. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var elections = [Election]()

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet var ElectionName: [UILabel]!
    @IBOutlet var desc: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        load()
    }
    
    @IBAction func add(_ sender: UIButton) {
        var nameTextField = UITextField()
        var descTextField = UITextField()
        let alert = UIAlertController(title: "Create new", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Create New", style: .default) { (action) in
            
            let newElection = Election(context: self.context)
            newElection.name = nameTextField.text!
            newElection.desc = descTextField.text!
            self.save()
        }
       alert.addTextField { (alertText) in
                  alertText.placeholder = "Add the Name of the Election"
                  nameTextField = alertText
              }
              alert.addTextField { (alertText) in
                 alertText.placeholder = "Add Some Desc"
                  descTextField = alertText
        }
                  alert.addAction(action)
                  present(alert,animated: true,completion: nil)
    }
    //MARK: - Data view Method
    func updateView(){
        var array = 0
        var electionName = elections.count - 1
        while(array<=ElectionName.count - 1 && electionName>=0){
        ElectionName[array].text = elections[electionName].name
            desc[array].text = elections[electionName].desc
            array += 1
            electionName -= 1
        }
    }
    

//MARK: - Data Methods
    
    func save(){
        do{
            try context.save()
        }catch{
            print("Error\(error)")
        }
        load()
    }
    func load(){
        let request : NSFetchRequest<Election> = Election.fetchRequest()
        do{
            elections = try context.fetch(request)
        }catch{
            print("Elections \(error)")
        }
        updateView()
   }
}

