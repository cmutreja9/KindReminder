//
//  editViewController.swift
//  KindReminder
//
//  Created by Chinky Mutreja on 24/5/18.
//  Copyright © 2018 Chinky Mutreja. All rights reserved.
//

import UIKit

class editViewController: UIViewController {

    @IBOutlet weak var quoteText: UITextView!
    @IBOutlet weak var isOn: UISwitch!
    
    @IBOutlet weak var nameText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func isOnButton(_ sender: Any) {
    }
}
