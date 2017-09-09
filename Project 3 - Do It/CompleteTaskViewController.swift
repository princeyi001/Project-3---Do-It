//
//  CompleteTaskViewController.swift
//  Project 3 - Do It
//
//  Created by Dong Hun Yi on 9/9/17.
//  Copyright © 2017 PrinceYiCoding. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

    @IBOutlet weak var taskLabel: UILabel!
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    var task : Task? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        taskLabel.text = task!.name
        
        if task!.important == true {
           importantSwitch.setOn(true, animated: false)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func importantSwitched(_ sender: Any) {
        task!.important = importantSwitch.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    @IBAction func completeTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
