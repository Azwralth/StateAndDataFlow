//
//  ContentViewViewModel.swift
//  StateAndDataFlow
//
//  Created by Владислав Соколов on 23.04.2024.
//

import Foundation
import Observation

@Observable
final class ContentViewViewModel {
    var counter = 3
    var buttonTitle = "Start"
    
    private var timer: Timer?
    
    func startTimer() {
        if counter > 0 {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(updateCounter),
                userInfo: nil,
                repeats: true
            )
        }
        buttonDidTapped()
    }
    
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
            buttonTitle = "Reset"
        }
    }
    
    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func buttonDidTapped() {
        if buttonTitle == "Reset" {
            buttonTitle = "Start"
            counter = 3
        } else {
            buttonTitle = "Wait..."
        }
    }
}
