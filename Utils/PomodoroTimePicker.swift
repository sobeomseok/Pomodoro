//
//  PomodoroTimePicker.swift
//  Pomodoro
//
//  Created by 소범석 on 2022/12/05.
//

import UIKit

class PomodoroTimePicker: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    // MARK: - Properties
    
    var didSelectSetting: ((_ runTime: Int, _ downTime: Int, _ times: Int) -> Void)?
    
    private var isTimerStarted = false
    
    private lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        return pickerView
    }()
    
    private var runTime: [Int] = []
    private var downTime: [Int] = []
    private var times: [Int] = []
    
    var inputView: UIView {
        return pickerView
    }
    
    // MARK: - Helpers
    private func setup() {
        runTime = setRunTime()
        downTime = setDownTime()
        times = setTimes()
    }
    
    private func getTimes(of date: Date) -> [Date] {
        var times = [Date]()
        var currentDate = date
        
        currentDate = Calendar.current.date(bySetting: .hour, value: 7, of: currentDate)!
        currentDate = Calendar.current.date(bySetting: .minute, value: 00, of: currentDate)!
        
        let calendar = Calendar.current
        
        let interval = 60
        var nextDiff = interval - calendar.component(.minute, from: currentDate) % interval
        var nextDate = calendar.date(byAdding: .minute, value: nextDiff, to: currentDate) ?? Date()
        
        var hour = Calendar.current.component(.hour, from: nextDate)
        
        while(hour < 23) {
            times.append(nextDate)
            
            nextDiff = interval - calendar.component(.minute, from: nextDate) % interval
            nextDate = calendar.date(byAdding: .minute, value: nextDiff, to: nextDate) ?? Date()
            
            hour = Calendar.current.component(.hour, from: nextDate)
        }
        
        return times
    }
    
    // set Time
    private func setRunTime() -> [Int] {
        return [15, 25, 30, 50]
    }
    
    private func setDownTime() -> [Int] {
        var tmp: [Int] = []
        for i in 1...15 {
            tmp.append(i)
        }
        return tmp
    }
    
    private func setTimes() -> [Int] {
        var tmp: [Int] = []
        for i in 1...10 {
            tmp.append(i)
        }
        return tmp
    }
    
    // MARK: - UIPickerViewDelegate & DateSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return runTime.count
        case 1:
            return downTime.count
        case 2:
            return times.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label: UILabel
        
        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }
        
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        
        var text = ""
        
        switch component {
        case 0:
            text = String(runTime[row])
        case 1:
            text = String(downTime[row])
        case 2:
            text = String(times[row])
        default:
            break
        }
        
        label.text = text
        
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let runTimeIndex = pickerView.selectedRow(inComponent: 0)
        let downTimeIndex = pickerView.selectedRow(inComponent: 1)
        let timesIndex = pickerView.selectedRow(inComponent: 2)
        
        guard runTime.indices.contains(runTimeIndex),
              downTime.indices.contains(downTimeIndex),
              times.indices.contains(timesIndex) else { return }
        
        let runTime = runTime[runTimeIndex]
        let downTime = downTime[downTimeIndex]
        let times = times[timesIndex]
        
        didSelectSetting?(runTime, downTime, times)
    }
}
