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
            basicAlert(title: "Error", message: "UIText fields can't be empty!")
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
            if myDay >= 1 && myDay <= 31 && myMonth >= 1 && myMonth <= 12{
                let weekday = dateFormatter.string(from: myDate)
                ResultLabel.text = weekday.capitalized
            }else{
                basicAlert(title: "Error", message: "Please check your date!")
                clearMyTextField()
            }
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
    
    func basicAlert(title: String?, message: String?){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:  "OK", style: .default))
            
            self.present(alert, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "info"{
            
            guard let vc = segue.destination as? infoViewController else{return}
            
            vc.infoText = "Adrians Freimanis"
            vc.nameText = "Info is ......"
        }
    }
    
    
}

