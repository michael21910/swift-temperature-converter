//
//  ViewController.swift
//  TempuratureConverter
//
//  Created by Tsuen Hsueh on 2021/10/4.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputTemp: UITextField!
    @IBOutlet weak var outputTemp: UILabel!
    
    @IBAction func tempConvert(sender: UIButton) {
        // if the text field is not empty
        if(inputTemp.text != "") {
            // check whether the number is valid
            var isValid:Bool = true
            var digit = 0
            for ch in inputTemp.text! {
                // negative number
                if(digit == 0 && ch == "-") {
                    continue
                }
                // invalid number situation
                if(!("0" <= ch && ch <= "9")) {
                    isValid = false
                    break
                }
                digit += 1
            }
            // the number that the user input is a valid number
            if(isValid == true) {
                if let temp = Double(inputTemp.text!) {
                    let num = String(format: "%.2f", (temp - 32) * 5 / 9)
                    outputTemp.text = num + "ºC"
                }
                let alertController = UIAlertController(title: "Correct input!", message: "Successfully converted", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                present(alertController, animated: true, completion: nil)
            }
            // the number that the user input is not a valid number
            else {
                let alertController = UIAlertController(title: "Something went wrong!", message: "This is not a number, please try again", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                present(alertController, animated: true, completion: nil)            }
        }
        // if the text field not empty, show error message
        else {
            let alertController = UIAlertController(title: "Something went wrong!", message: "Please input the temperature in the text field", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

