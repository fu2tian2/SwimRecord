//
//  TimeRecorder.swift
//  SwimRecord
//
//  Created by Issei  on 2020/09/18.
//

import UIKit

class TimeRecorder: UIViewController {
    
    @IBOutlet weak var timerVal: UILabel!
    
    var swimTimer = Timer()
    var timerDisplayed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // if timer is running, make it stop.
        
    }
    
    func recordTime() {
        //今inputしたい場所にstartTimer()で回ってるタイマーの値からサイクルとかで決まる値を引いて入力
    }
    
    @IBAction func startPressed(_ sender: UIButton) {
        swimTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(Action), userInfo: nil, repeats: true)
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        swimTimer.invalidate()
    }
    
    @objc func Action() {
        timerDisplayed += 1
        changeTimerVal()
    }
    
    func changeTimerVal(){
        let msec1 = timerDisplayed % 10
        let ext1 = (timerDisplayed-msec1)/10
        let msec2 = ext1 % 10
        let ext2 = (ext1-msec2)/10
        let sec1 = ext2 % 10
        let ext3 = (ext2-sec1)/10
        let sec2 = ext3 % 6
        let min = (ext3-sec2)/6
        timerVal.text = "\(String(min)):\(String(sec2))\(String(sec1)):\(String(msec2))\(String(msec1))"
    }
    
    
    
    


}
