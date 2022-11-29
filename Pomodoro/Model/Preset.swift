//
//  WaitingList.swift
//  Pomodoro
//
//  Created by 소범석 on 2022/11/15.
//

import UIKit

struct Preset {
    var presetImage: UIImage?
    var presetName: String
    var runtime: String
    var downtime: String?
    var times: String
    
    init(presetImage: UIImage? = nil, presetName: String, runtime: String, downtime: String? = nil, times: String) {
        self.presetImage = presetImage
        self.presetName = presetName
        self.runtime = runtime
        self.downtime = downtime
        self.times = times
    }
}
