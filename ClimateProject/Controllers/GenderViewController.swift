//
//  GenderViewController.swift
//  ClimateProject
//
//  Created by Jinqi Li on 5/12/20.
//  Copyright © 2020 Jinqi Li. All rights reserved.
//

import UIKit
import Firebase

class GenderViewController: UIViewController {
    
    var documentID: String!
    var nameText: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
// MARK: - Save Gender
    @IBAction func genderSelected(_ sender: UIButton) {
        print(sender.titleLabel!.text)
        let genderInput = sender.titleLabel!.text
        let db = Firestore.firestore()
        db.collection("users").document(documentID!).setData(["gender": genderInput], merge: true)
        
        performSegue(withIdentifier: "goToAgeEdu", sender: self)
        
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
        if segue.identifier == "goToAgeEdu" {
            let ageeduVC = segue.destination as! AgeEduViewController
            ageeduVC.documentID = documentID
            ageeduVC.nameText = nameText
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
