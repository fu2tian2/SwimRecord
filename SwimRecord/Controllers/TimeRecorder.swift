//
//  TimeRecorder.swift
//  SwimRecord
//
//  Created by Issei  on 2020/09/18.
//

import UIKit

//var meters = 200
//var reps = 3
//var swimmers = 4
//var cycles = 180
//var labelCnt = 1

class TimeRecorder: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var timerVal: UILabel!
    @IBOutlet weak var recordTableView: UITableView!
    
    var records: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var cnter = 0
        while cnter < labelCnt {
            var nswimmer = (cnter % swimmers)
            let extra = (cnter-nswimmer) / swimmers
            var nmeter = (extra % (meters/50))
            var nrep = (extra-nmeter) / (meters/50)
            
            nswimmer += 1
            nmeter = (nmeter+1)*50
            nrep += 1
            
            let appendingIndex = "\(nrep)-\(nmeter)-\(nswimmer)"
            records.append(appendingIndex)
            
            //debug
//            print("\(cnter)番目")
//            print(appendingIndex)
            
            cnter += 1
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // if timer is running, make it stop.
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count //seek how to change this into labelCnt in ViewController.swift
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = recordTableView.dequeueReusableCell(withIdentifier: "recordCell", for: indexPath)
        
        cell.textLabel!.text = records[indexPath.row]
        
        return cell
    }
    
//MARK: - UITableView timerecording
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentTime = timerVal.text!
        let currentIndex = records[indexPath.row]
        records[indexPath.row] = "\(currentIndex) : \(currentTime)"
        recordTableView.reloadRows(at: [indexPath], with: .none)
    }
    
//MARK: - Timer
    
    var swimTimer = Timer()
    var timerDisplayed = 0
    
    @IBAction func startPressed(_ sender: UIButton) {
        swimTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(Action), userInfo: nil, repeats: true)
    }
    //SOLVE THIS!!!
    //timer cannot stop when startbutton is pressed twice.
    
    @IBAction func savePressed(_ sender: UIButton) {
        swimTimer.invalidate()
    }
    
    @objc func Action() {
        timerDisplayed += 1
        timerVal.text = changeTimerVal(mseconds: timerDisplayed)
    }
    
    func changeTimerVal(mseconds: Int) -> String{
        let msec1 = mseconds % 10
        let ext1 = (mseconds-msec1)/10
        let msec2 = ext1 % 10
        let ext2 = (ext1-msec2)/10
        let sec1 = ext2 % 10
        let ext3 = (ext2-sec1)/10
        let sec2 = ext3 % 6
        let min = (ext3-sec2)/6
        return "\(String(min)):\(String(sec2))\(String(sec1)):\(String(msec2))\(String(msec1))"
    }
    
}
