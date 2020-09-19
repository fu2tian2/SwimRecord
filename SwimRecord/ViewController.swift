//
//  ViewController.swift
//  SwimRecord
//
//  Created by Issei  on 2020/09/18.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numberOfPeople: UILabel!
    
    var swimmerCnt = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "startToRecorder", sender: self)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        swimmerCnt = Int(sender.value)
        let swimmerCntString = String(swimmerCnt)
        numberOfPeople.text = "number of swimmers: \(swimmerCntString)"
    }
    
}

