//
//  ViewController.swift
//  IMCSwiftIOS
//
//  Created by Mañanas on 22/7/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var num1: UITextField!
    @IBOutlet weak var num2: UITextField!
    
    @IBOutlet weak var resultDown: UILabel!
    
    var height:Int = 150
    var weight:Float = 70
   
    
    
    override func viewDidLoad() {
        resultDown.text = "0"
        super.viewDidLoad()
       
    }
    
    @IBAction func onHeighChange(_ sender: UIStepper) {
        height = Int(sender.value)
        heightLabel.text = "\(height) cm"
    }
    
    
    @IBAction func onWeightChange(_ sender: UISlider) {
        weight = sender.value
        let formattedNumber = String(format: "%.2f", weight)
        weightLabel.text = "\(formattedNumber) Kg"
    }
    
    
    @IBAction func calculate(_ sender: Any) {
        print("Altura: \(height)")
        print("Peso: \(weight)")
    }
    
    
    @IBAction func sumButton(_ sender: Any){
        guard let text1 = num1.text, let number1 = Float(text1),
              let text2 = num2.text, let number2 = Float(text2) else {
            resultDown.text = "Por favor, ingresa números válidos"
            return
        }
        
        let sum = number1 + number2
        resultDown.text = String(format: "%.2f", sum)
    }
    

    @IBAction func resButton(_ sender: Any) {
        guard let text1 = num1.text, let number1 = Float(text1),
              let text2 = num2.text, let number2 = Float(text2) else {
            resultDown.text = "Por favor, ingresa números válidos"
            return
        }
        
        let res = number1 - number2
        resultDown.text = String(format: "%.2f", res)
    }
    
    
    
    @IBAction func mulButton(_ sender: Any) {
        guard let text1 = num1.text, let number1 = Float(text1),
              let text2 = num2.text, let number2 = Float(text2) else {
            resultDown.text = "Por favor, ingresa números válidos"
            return
        }
        
        let mul = number1 * number2
        resultDown.text = String(format: "%.2f", mul)
    }
    
    
    @IBAction func divButton(_ sender: Any) {
        guard let text1 = num1.text, let number1 = Float(text1),
              let text2 = num2.text, let number2 = Float(text2) else {
            resultDown.text = "Por favor, ingresa números válidos"
            return
        }
        
        let div = number1 / number2
        resultDown.text = String(format: "%.2f", div)
    }
}

