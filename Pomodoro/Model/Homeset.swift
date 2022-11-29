//
//  Easyset.swift
//  Pomodoro
//
//  Created by 소범석 on 2022/11/29.
//

import UIKit

struct Homeset {
    var runtime: Int
    var downtime: Int
    var times: Int
    
    init(runtime: Int, downtime: Int, times: Int) {
        self.runtime = runtime
        self.downtime = downtime
        self.times = times
    }
}

