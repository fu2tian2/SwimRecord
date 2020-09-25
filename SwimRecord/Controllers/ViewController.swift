//
//  ViewController.swift
//  SwimRecord
//
//  Created by Issei  on 2020/09/18.
//

import UIKit

//MARK: - common variables

var meters = 200
var reps = 3
var swimmers = 4
var cycles = 180
var labelCnt = 1

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var metersTextField: UITextField!
    @IBOutlet weak var repsTextField: UITextField!
    @IBOutlet weak var numbersTextField: UITextField!
    @IBOutlet weak var cyclesTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        metersTextField.delegate = self
        repsTextField.delegate = self
        numbersTextField.delegate = self
        cyclesTextField.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func startPressed(_ sender: UIButton) {
        // posess how many table views are required for the training menu
        getVal()
        self.performSegue(withIdentifier: "startToRecorder", sender: self)
    }
    
    func getVal() {
        let metersText: String = metersTextField.text!
        let repsText: String = repsTextField.text!
        let numbersText: String = numbersTextField.text!
        let cyclesText: String = cyclesTextField.text!
        
        meters = Int(metersText)!
        reps = Int(repsText)!
        swimmers = Int(numbersText)!
        cycles = Int(cyclesText)!
        
        labelCnt *= (meters*reps*swimmers)/50
    }
    
    //MARK:- textFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { //what to do just before return is pressed.
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    
    
}

