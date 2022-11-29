//
//  WaitingListViewModel.swift
//  Pomodoro
//
//  Created by 소범석 on 2022/11/15.
//

import UIKit

class PresetListViewModel {
    private var presetListArray: [Preset] = []
    
    func makePresetListData() {
        presetListArray = [
            Preset(presetName: "자기 계발", runtime: "25분", downtime: "5분", times: "6회"),
            Preset(presetName: "운동", runtime: "45초", downtime: "15초", times: "6회"),
            Preset(presetName: "운동", runtime: "45초", downtime: "15초", times: "6회"),
            Preset(presetName: "운동", runtime: "45초", downtime: "15초", times: "6회"),
            Preset(presetName: "운동", runtime: "45초", downtime: "15초", times: "6회"),
        ]
    }
    
    func getPresetListData() -> [Preset] {
        return presetListArray
    }
}
