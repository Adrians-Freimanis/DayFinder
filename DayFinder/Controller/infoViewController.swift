//
//  infoViewController.swift
//  DayFinder
//
//  Created by adrians.freimanis on 17/04/2023.
//

import UIKit

class infoViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    var infoText: String = ""
    var nameText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if !nameText.isEmpty{
            nameLabel.text = nameText
            infoLabel.text = infoText
        }
        
        // Do any additional setup after loading the view.
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
