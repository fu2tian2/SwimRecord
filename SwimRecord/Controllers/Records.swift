//
//  Records.swift
//  SwimRecord
//
//  Created by Issei  on 2020/09/24.
//

import Foundation

struct Records {
    let nMeter: Int
    let nRep: Int
    let nSwimmer: Int
    let startingTime: Int
    
    var nTime: Int?
    
    func displayer() -> String {
        if let recordedTime = nTime {
            if recordedTime < startingTime {
                return "\(nRep)-\(nMeter)-\(nSwimmer) : Tapping too early!!"
            } else {
                let displayTime = changeTimerVal(mseconds: recordedTime-startingTime)
                print(displayTime)
                print(recordedTime)
                print(startingTime)
                return "\(nRep)-\(nMeter)-\(nSwimmer) : \(displayTime)"
            }
            
        } else {
            return "\(nRep)-\(nMeter)-\(nSwimmer) : Not yet recorded."
        }
    }
}
