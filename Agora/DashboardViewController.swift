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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

