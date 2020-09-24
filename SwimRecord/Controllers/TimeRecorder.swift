//
//  TimeRecorder.swift
//  SwimRecord
//
//  Created by Issei  on 2020/09/18.
//

import UIKit

class TimeRecorder: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var timerVal: UILabel!
    @IBOutlet weak var recordTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // if timer is running, make it stop.
    }
    
    //MARK: - UITableViewDelegate
    
    var records: [String] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count //seek how to change this into labelCnt in ViewController.swift
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = recordTableView.dequeueReusableCell(withIdentifier: "recordCell", for: indexPath)
        
        cell.textLabel!.text = records[indexPath.row]
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    
//MARK: - Timer
    
    var swimTimer = Timer()
    var timerDisplayed = 0
    
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
