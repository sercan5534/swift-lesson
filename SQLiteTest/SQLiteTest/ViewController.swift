//
//  ViewController.swift
//  SqliteTest
//
//  Created by Sercan on 15/01/2017.
//  Copyright © 2017 Gio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        DBUtil.sharedInstance.addStudent(name: "Fatih")
        DBUtil.sharedInstance.addStudent(name: "Sercan")
        DBUtil.sharedInstance.addStudent(name: "Ahmet")
        
        
        var row = DBUtil.sharedInstance.getById(id: 1)
        print(row!.get(DBUtil.sharedInstance.Name))
        
        DBUtil.sharedInstance.deleteById(id: 1)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

