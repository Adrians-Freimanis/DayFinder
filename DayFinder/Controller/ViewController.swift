//
//  ViewController.swift
//  DayFinder
//
//  Created by adrians.freimanis on 17/04/2023.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var DayTextField: UITextField!
    
    
    @IBOutlet weak var MonthTextField: UITextField!
    
    
    @IBOutlet weak var YearTextField: UITextField!
    
    
    @IBOutlet weak var ResultLabel: UILabel!
    
    
    @IBOutlet weak var FindButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        ResultLabel.layer.cornerRadius = 10

    }


    @IBAction func FindButtonTapped(_ sender: Any) {
        
        let calendar  = Calendar.current
        var dateComponents = DateComponents()
        
//        dateComponents.day = Int (DayTextField.text!)
        
        guard let myDay = Int(DayTextField.text ?? ""),let myMonth = Int(MonthTextField.text ?? ""), let myYear = Int(YearTextField.text ?? "")  else{
            #warning("Warning for alert input")
            return
        }
        dateComponents.day = myDay
        dateComponents.month = myMonth
        dateComponents.year = myYear
        
        guard let myDate = calendar.date(from: dateComponents)else{return}
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "lv_LV")
        dateFormatter.dateFormat = "EEEE"
        
        switch FindButton.titleLabel?.text{
        case "Find":
            FindButton.setTitle("Clear", for: .normal)
            let weekday = dateFormatter.string(from: myDate)
            ResultLabel.text = weekday.capitalized
            #warning("Check the input for right values")
        default:
            FindButton.setTitle("Find", for: .normal)
            clearMyTextField()
        }
        
    }//FindButtonTapped
    
    func clearMyTextField(){
        DayTextField.text = ""
        MonthTextField.text = ""
        YearTextField.text = ""
        ResultLabel.text = "Result"
    }
    
    //To click off keyboard func
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}

