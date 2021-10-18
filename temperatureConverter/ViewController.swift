//
//  ViewController.swift
//  TempuratureConverter
//
//  Created by Tsuen Hsueh on 2021/10/4.
//

import UIKit

class ViewController: UIViewController {

    // font color
    let myFontColor = UIColor(red: 105/255, green: 70/255, blue: 53/255, alpha: 1.0)
    let myBackgroundColor = UIColor(red: 242/255, green: 240/255, blue: 221/255, alpha: 1.0)
    
    @IBOutlet weak var inputTemp: UITextField!
    @IBOutlet weak var outputTemp: UILabel!
    
    @IBAction func tempConvert(sender: UIButton) {
        // if the text field is not empty
        if(inputTemp.text != "") {
            if let temp = Double(inputTemp.text!) {
                let num = String(format: "%.2f", (temp - 32) * 5 / 9)
                outputTemp.text = num + "ºC"
                if((Double(num)!) <= 0) {
                    outputTemp.textColor = UIColor.white
                    outputTemp.backgroundColor = UIColor.blue
                }
                else if((Double(num)!) >= 100) {
                    outputTemp.textColor = UIColor.white
                    outputTemp.backgroundColor = UIColor.red
                }
                else {
                    outputTemp.textColor = UIColor.white
                    outputTemp.backgroundColor = UIColor.orange
                }
            }
            // if the text field not empty
            else {
                let alertController = UIAlertController(title: "Something went wrong!", message: "This is not a valid number!", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                present(alertController, animated: true, completion: nil)
        
                // the style of the output area
                outputTemp.textColor = myFontColor
                outputTemp.backgroundColor = myBackgroundColor
                outputTemp.text = "error"
            }
        }
        // if the text field is empty, show the error message
        else {
            let alertController = UIAlertController(title: "Something went wrong!", message: "Please input the temperature in the text field", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            present(alertController, animated: true, completion: nil)
            
            // the style of the output area
            outputTemp.textColor = myFontColor
            outputTemp.backgroundColor = myBackgroundColor
            outputTemp.text = "error"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize the placeholder of the output area
        outputTemp.text = "output area"
        outputTemp.textColor = myFontColor
        outputTemp.backgroundColor = UIColor(red: 242/255, green: 240/255, blue: 221/255, alpha: 1.0)
    }

}
