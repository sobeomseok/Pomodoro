//
//  WaitingListViewModel.swift
//  Pomodoro
//
//  Created by 소범석 on 2022/11/15.
//

import UIKit

class WaitingListViewModel {
    private var waitingListArray: [WaitingList] = []
    
    func makeWaitingListData() {
        waitingListArray = [
            WaitingList(waitingListName: "자기 계발", runtime: "25분", downtime: "5분", times: "6회"),
            WaitingList(waitingListName: "운동", runtime: "45초", downtime: "15초", times: "6회"),
            WaitingList(waitingListName: "운동", runtime: "45초", downtime: "15초", times: "6회"),
            WaitingList(waitingListName: "운동", runtime: "45초", downtime: "15초", times: "6회"),
            WaitingList(waitingListName: "운동", runtime: "45초", downtime: "15초", times: "6회"),
        ]
    }
    
    func getWaitingListData() -> [WaitingList] {
        return waitingListArray
    }
}
