//
//  Controller.swift
//  InterviewApp
//
//  Created by Bartłomiej Smektała on 16/12/2020.
//

import Foundation

enum State: Int {
    case data, error, empty
}

class Controller {
    var data: [String?] = []
    
    public var delegate: View?
    
    func getData() -> State {
        let state = State(rawValue: Int.random(in: 0..<3))
        
        if state == .data {
            self.data = self.getRandomDataToDisplay()
            return .data
        } else if state == .error {
            return .error
        } else {
            return .error
        }
    }

    private func getRandomDataToDisplay() -> [String?] {
        var array = [String?](repeating: nil, count: Int.random(in: 0..<100))
        
        var i = 0
        
        while i < array.count {
            array[i] = self.randomString(length: Int.random(in: 0..<50))
            i += 1
        }
        
        return array
    }
    
    private func randomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
}
