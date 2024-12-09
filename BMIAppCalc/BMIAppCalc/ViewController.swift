//
//  ViewController.swift
//  BMIAppCalc
//
//  Created by english on 2023-09-25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtHeightInCm: UITextField!
    
    @IBOutlet weak var txtWeightInKg: UITextField!
    
    @IBOutlet weak var lblClassification: UILabel!
    
    @IBOutlet weak var btnCalculate: UIButton!
    
    @IBAction func btnCalculateTouchUpInside(_ sender: Any) {
        
        if let heightInCm = Double(txtHeightInCm.text!){
            
            if let weightInKg = Double(txtWeightInKg.text!){
                
                if (heightInCm < 80 || heightInCm > 250) {
                    Toast.ok(view: self, title: "Review the height", message: "Enter a height between 80 cm and 250 cm.")
                    return
                }
                
                if (weightInKg < 30 || weightInKg > 300) {
                    Toast.ok(view: self, title: "Review the weight", message: "Enter a weight between 30 kg and 300 kg.")
                    return
                }
                
                let heightInMeters = heightInCm / 100
                let bmi = weightInKg / pow(heightInMeters,2)
                let roundBmi = round(bmi * 10) / 10
                
                var classification : String
                switch (roundBmi){
                    case 0..<18.5:
                        classification = "Underweight"
                        lblClassification.backgroundColor = .blue
                        break
                    case 18.5..<25:
                        classification = "Normal weight"
                        lblClassification.backgroundColor = UIColor.green
                        break
                    case 25..<30:
                        classification = "Overweight"
                        lblClassification.backgroundColor = .yellow
                        break
                    case 30...100:
                        classification = "Obesity"
                        lblClassification.backgroundColor = .orange
                        break
                    default:
                        classification = "Out of range"
                        lblClassification.backgroundColor = UIColor(red: 150, green: 150, blue: 150, alpha: 1)
                        break
                }
                
                lblClassification.text = "BMI Classification = \(classification)"
                lblClassification.isHidden = false
                
            } else {
                Toast.ok(view: self, title: "Ooops!", message: "Plase enter a valid weight")
            }
            
        } else {
            Toast.ok(view: self, title: "Ooops!", message: "Please enter a valid height")
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblClassification.isHidden = true
        btnCalculate.layer.cornerRadius = 15
    }

    @IBAction func inputsChanged(_ sender: Any) {
        lblClassification.isHidden = true
    }
    
}

