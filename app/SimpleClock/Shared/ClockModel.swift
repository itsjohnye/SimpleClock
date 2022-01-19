//
//  ClockModel.swift
//  SimpleClock
//
//  Created by John Ye on 2021/12/16.
//

import Foundation

extension Date {
    func formatDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd E"
        return dateFormatter.string(from: self)
    }
    func formatHoursAndMinutes() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("HH mm")
        return dateFormatter.string(from: self)
    }
    
    func formatSeconds() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("ss")
        return dateFormatter.string(from: self)
    }
}
