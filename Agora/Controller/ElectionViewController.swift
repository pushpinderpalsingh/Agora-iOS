//
//  ElectionViewController.swift
//  Agora
//
//  Created by Pushpinder Pal Singh on 26/03/20.
//  Copyright © 2020 Pushpinder Pal Singh. All rights reserved.
//

import UIKit

class ElectionViewController : UIViewController {
    @IBOutlet weak var ElectionName: UILabel!
    @IBOutlet weak var desc: UILabel!
    var nameString : String = ""
    var descString = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        ElectionName.text = nameString
        desc.text = descString
    }
}
