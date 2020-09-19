//
//  TimeRecorder.swift
//  SwimRecord
//
//  Created by Issei  on 2020/09/18.
//

import UIKit

class TimeRecorder: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // if timer is running, make it stop.
        
    }
    
    func startTimer(){
        //timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: <#T##Selector#>, userInfo: <#T##Any?#>, repeats: <#T##Bool#>)
        //run this func when start button is pressed.
    }
    
    func recordTime() {
        //今inputしたい場所にstartTimer()で回ってるタイマーの値からサイクルとかで決まる値を引いて入力
    }
    
    
    
    


}
