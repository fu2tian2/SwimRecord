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
//var divisor = 25

class TimeRecorder: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var timerVal: UILabel!
    @IBOutlet weak var recordTableView: UITableView!
    
    var records = [Records]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var cnter = 0
        while cnter < labelCnt {
            var nswimmer = (cnter % swimmers)
            let extra = (cnter-nswimmer) / swimmers
            var nmeter = (extra % (meters/divisor))
            var nrep = (extra-nmeter) / (meters/divisor)
            let startingtime = cycles*nrep+(nswimmer)*1000
            
            nswimmer += 1
            nmeter = (nmeter+1)*divisor
            nrep += 1
            
            let record = Records(nMeter: nmeter, nRep: nrep, nSwimmer: nswimmer, startingTime: startingtime)
            records.append(record)
            
            //debug
            print("\(cnter)番目")
            print(nrep)
            print(nmeter)
            print(nswimmer)
            print(startingtime)
            
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
        
        cell.textLabel!.text = records[indexPath.row].displayer()
        
        return cell
    }
    
//MARK: - UITableView timerecording
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        records[indexPath.row].nTime = timerDisplayed
        recordTableView.reloadRows(at: [indexPath], with: .none)
    }
    
//MARK: - Timer
    
    var swimTimer = Timer()
    var timerDisplayed = 0
    
    @IBAction func startPressed(_ sender: UIButton) {
        swimTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(Action), userInfo: nil, repeats: true)
    }
    //2kai　
    
    @IBAction func savePressed(_ sender: UIButton) {
        swimTimer.invalidate()
    }
    
    @objc func Action() {
        timerDisplayed += 1
        timerVal.text = changeTimerVal(mseconds: timerDisplayed)
    }
}
