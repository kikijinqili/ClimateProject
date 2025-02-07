//
//  TurtleOneViewController.swift
//  ClimateProject
//
//  Created by Jinqi Li on 6/6/20.
//  Copyright © 2020 Jinqi Li. All rights reserved.
//

import UIKit
import Firebase

class TurtleOneViewController: UIViewController {
    
    var documentID: String!
    var nameText: String!
    @IBOutlet weak var scroller: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(nameText!)
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        scroller.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 1350)
    }
    
// MARK: - Navigation
        
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
            if documentID != nil {
                return true
            } else {
                return false
            }
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTwo" {
            let twoVC = segue.destination as! TurtleTwoViewController
            twoVC.documentID = documentID
            twoVC.nameText = nameText
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
