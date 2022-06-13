//
//  ViewController.swift
//  Calculator
//
//  Created by omer faruk bozbulut on 22.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var result = Numbers.zero.rawValue
    var firstNumber = ""
    var equal : Float = 0.0
    var process = Process.plus
    var repetition = false
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func clickNumber(_ sender: UIButton) {
        guard let numberText = sender.titleLabel?.text, let number = Numbers(rawValue: numberText) else { return }
        
        if number == .zero {
            result = ""
        }
        
        result += "\(sender.titleLabel?.text ?? Numbers.zero.rawValue)"
        updateLabel()
    }
    
    @IBAction func process(_ sender: UIButton) {
        switch sender.titleLabel?.text{
        case Process.plus.rawValue:
            process = Process.plus
        case Process.minus.rawValue:
            process = Process.minus
        case Process.multiply.rawValue:
            process = Process.multiply
        case Process.divide.rawValue:
            process = Process.divide
        default:
            break;
        }
        
        repetition = true
        firstNumber = result
        result = ""
        updateLabel()
    }
    
    @IBAction func resetPressed(_ sender: UIButton) {
        firstNumber = ""
        result = ""
        updateLabel()
    }
    
    @IBAction func dotPressed(_ sender: UIButton) {
        if result.firstIndex(of: ".") == nil {
            result += "."
            updateLabel()
        }
    }
    
    
    @IBAction func equals(_ sender: UIButton) {
        if repetition && !result.isEmpty && !firstNumber.isEmpty{
            switch process{
            case .plus:
                equal = Float(firstNumber)! + Float(result)!
                
            case .multiply:
                equal = Float(firstNumber)! * Float(result)!
                
            case .divide:
                equal = Float(firstNumber)! / Float(result)!
                
            case .minus:
                equal = Float(firstNumber)! - Float(result)!
            }
        }
        
        result = equal.convertToIntString
        repetition = false
        updateLabel()
    }
    
    @IBAction func convertToNegative(_ sender: UIButton) {
        if result.isEmpty { return }
        let negative = Float(result)!*(-1)
        result = negative.convertToIntString
        updateLabel()
    }
    
    @IBAction func percent(_ sender: UIButton) {
        let percentResult = Float(result)!/100
        result = percentResult.convertToIntString
        updateLabel()
    }
    
    
    func updateLabel(){
        resultLabel.text = result
    }
}

extension Float {
    var convertToIntString: String {
       return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
