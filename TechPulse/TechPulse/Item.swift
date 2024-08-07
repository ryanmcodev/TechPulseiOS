//
//  Item.swift
//  TechPulse
//
//  Created by RyanM on 8/7/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
