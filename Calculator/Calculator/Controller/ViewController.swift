//
//  ViewController.swift
//  Calculator
//
//  Created by omer faruk bozbulut on 22.05.2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var resultLabel: UILabel!
    
    var result = ""
    var number1 = ""
    var equal = 0
    var process = Process.plus
    var repetition = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func clickNumber(_ sender: UIButton) {
        if result != "0"{
            result += "\(sender.titleLabel?.text ?? "0")"
            updateLabel()
        }
    }
    
    @IBAction func process(_ sender: UIButton) {
        
        switch sender.titleLabel?.text{
        case "+":
            process = Process.plus
        case "-":
            process = Process.minus
        case "*":
            process = Process.multiply
        case "/":
            process = Process.divide
        default:
            break;
        }
        
        repetition = true
        number1 = result
        result = ""
        updateLabel()
    }
    
    @IBAction func resetPressed(_ sender: UIButton) {
        number1 = ""
        result = ""
        updateLabel()
    }
    
    @IBAction func equals(_ sender: UIButton) {
        if repetition && result != ""{
            switch process{
            case Process.plus:
                equal = Int(number1)! + Int(result)!
                result = String(equal)
                
            case Process.multiply:
                equal = Int(number1)! * Int(result)!
                result = String(equal)
                
            case Process.divide:
                let equalFloat = Float(number1)! / Float(result)!
                result = String(equalFloat)
                
            case Process.minus:
                equal = Int(number1)! - Int(result)!
                result = String(equal)
            }
        }
        
        repetition = false
        updateLabel()
    }
    
    func updateLabel(){
        resultLabel.text = result
    }
}
