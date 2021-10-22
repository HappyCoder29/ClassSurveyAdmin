//
//  AddClassViewController.swift
//  ClassSurveyAdmin
//
//  Created by Ashish Ashish on 10/21/21.
//

import UIKit
import Firebase

class AddClassViewController: UIViewController {

    @IBOutlet weak var txtClassTitle: UITextField!
    
    var ref: DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
    }
    
    @IBAction func addClassAction(_ sender: Any) {
        let title = txtClassTitle.text
        if title?.count == 0 {
            return
        }
        let classInfo = ClassInfo()
        classInfo.title = txtClassTitle.text!
        classInfo.yes = 0
        classInfo.no = 0
        
        guard let key = ref.child("Classes").childByAutoId().key else { return }
        
        let info : [String: Any] = [    "Title": classInfo.title,
                                        "Yes": classInfo.yes,
                                        "No": classInfo.no
                                    ]
        
        ref.child("Classes").updateChildValues( [key  : info] )
        navigationController?.popViewController(animated: true)
    }
}
