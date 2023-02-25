//
//  ViewController.swift
//  Conversores
//
//  Created by Yan Chagas on 15/02/23.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    @IBOutlet weak var lbUnit: UILabel!
    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var btUnit1: UIButton!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var btUnit2: UIButton!
    @IBOutlet weak var lbResultUnit: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func showNext(_ sender: UIButton) {

        switch lbUnit.text!{
            case "Temperature":
                lbUnit.text = "Weight"
                btUnit1.setTitle("Kilograms", for: .normal)
                btUnit2.setTitle("Pounds", for: .normal)
            case "Weight":
                lbUnit.text = "Distance"
                btUnit1.setTitle("Meters", for: .normal)
                btUnit2.setTitle("Kilometers", for: .normal)
            case "Distance":
                lbUnit.text = "Currency"
                btUnit1.setTitle("Real", for: .normal)
                btUnit2.setTitle("Dollar", for: .normal)
            default:
                lbUnit.text = "Temperature"
                btUnit1.setTitle("Celsius", for: .normal)
                btUnit2.setTitle("Fahrenheit", for: .normal)
            }
        convert(nil)
    }

    @IBAction func convert(_ sender: UIButton?) {
        if let sender = sender {
            if sender == btUnit1 {
            btUnit2.alpha = 0.5
        } else{
            btUnit1.alpha = 0.5
        }
        sender.alpha = 1.0
    }
        switch lbUnit.text!{
                    case "Temperature":
                        calcTemperature()
                    case "Weight":
                        calcWeight()
                    case "Distance":
                        calcDistance()
                    default:
                        calcCurrency()
                    }
        view.endEditing(true)
        let result = Double(lbResult.text!)!
        lbResult.text = String(format: "%.2f", result)
            }
            
            func calcTemperature() {
                guard let temperature = Double(tfValue.text!) else {return}
                if btUnit1.alpha == 1.0 {
                    lbResultUnit.text = "Fahrenheint"
                    lbResult.text = String(temperature * 1.8 + 32.0)
                }else {
                    lbResultUnit.text = "Celsius"
                    lbResult.text = String((temperature - 32.0) / 1.8)
                }
                
            }
            func calcWeight() {
                guard let weight = Double(tfValue.text!) else {return}
                if btUnit1.alpha == 1.0 {
                    lbResultUnit.text = "Pounds"
                    lbResult.text = String(weight * 2.2046)
                }else {
                    lbResultUnit.text = "Kilograms"
                    lbResult.text = String(weight / 2.2046)
                }
            }
            func calcDistance() {
                guard let distance = Double(tfValue.text!) else {return}
                if btUnit1.alpha == 1.0 {
                    lbResultUnit.text = "Kilometers"
                    lbResult.text = String(distance / 1000)
                }else {
                    lbResultUnit.text = "Meters"
                    lbResult.text = String(distance * 1000)
                }
            }
            func calcCurrency() {
                guard let currency = Double(tfValue.text!) else {return}
                if btUnit1.alpha == 1.0 {
                    lbResultUnit.text = "Dollar"
                    lbResult.text = String(currency * 5)
                }else {
                    lbResultUnit.text = "Real"
                    lbResult.text = String(currency / 5)
                }
            }
}
        

