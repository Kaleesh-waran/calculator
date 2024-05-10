//
//  ViewModel.swift
//  Calculator
//
//  Created by Kaleeshwaran P on 13/12/22.
//

import Foundation

class ViewModel {
    
    static let shared: ViewModel = ViewModel()
    
    private var numberOnScreen: Double = 0
    private var isdot: Bool = false
    private var previousNumber: Double = 0
    private var operation = 0
    private var momary: [Int] = []
    
    func getValuve(tag: Int, vc: ViewController) {
        
        if tag >= 0 && tag < 10 || tag == 14 {
            
            self.numbers(tag: tag, vc: vc)
            
        } else {
            
            self.operators(tag: tag, vc: vc)
        }
        
    }
    
    private func numbers(tag: Int, vc: ViewController) {
        
        if vc.displayTextField.text?.isEmpty == true {
            
            tag == 14 ? (vc.displayTextField.text = "0.") : (vc.displayTextField.text = MyData.shared.valueList[tag])
            
        } else {
            
            vc.displayTextField.text = (vc.displayTextField.text ?? " ") + MyData.shared.valueList[tag]
        }
    }
    
    private func operators(tag: Int, vc: ViewController) {
        
        previousNumber = Double(vc.displayTextField.text ?? "0") ?? 0.0
        
        if vc.displayTextField.text?.isEmpty == false {
            
            if tag == 15 {
                
                numberOnScreen = 0
                previousNumber = 0
                operation = 0
                vc.displayTextField.text = ""
                vc.displayTextField.placeholder = "0"
                
            } else if tag == 16 {
                
                if 0 < vc.displayTextField.text?.count ?? 1  {
                    
                    var str: String = vc.displayTextField.text ?? " "
                    
                    str.removeLast()
                    
                    operation > 0 ? (vc.displayTextField.text = String(previousNumber)) : (vc.displayTextField.text = str)
                }
                
            } else if tag == 10 {
                
                previousNumber > 0 ? (vc.displayTextField.text = MyData.shared.valueList[tag]) : (vc.displayTextField.text = "")
                
            } else if tag == 11 {
                
                
            } else if tag == 12 {
                
                
            }else if tag == 12 {
                
                
            }else if tag == 13 {
                
                
            }else if tag == 17 {
                
                
            }else if tag == 18 {
                
                
            }else if tag == 19 {
                
                
            } else {
                
                
            }
        }
    }
}
