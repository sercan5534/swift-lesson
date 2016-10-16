//
//  ViewController.swift
//  Swift-OpenSSL-RSA-Encryption-Decryption
//
//  Created by Sercan on 13/10/16.
//  Copyright © 2016 Gio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var decryptedLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var encryptedTextArea: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func encryptDecrypt(sender: AnyObject) {
        var lib = RSALib()
        encryptedTextArea.text = lib.encrypt(textField.text!)
        decryptedLabel.text = lib.decrypt(encryptedTextArea.text!)
    }

}

