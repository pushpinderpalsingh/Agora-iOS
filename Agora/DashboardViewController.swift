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
        
    }
    
    @IBAction func add(_ sender: UIButton) {
        
    }
    //MARK: - Data view Method
    func updateView(){
        let e = ElectionName.count
        for i in ElectionName!.count{
            i.text = elections[i].name
            desc[i].text = elections[ i].desc
        }
    }
    

//MARK: - Data Methods
    
    func save(){
        do{
            try context.save()
        }catch{
            print("Error\(error)")
        }
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

