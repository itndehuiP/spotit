//
//  OptionModel.swift
//  spotit WatchKit Extension
//
//  Created by Guerson Perez on 16/05/21.
//

import Foundation

struct OptionModel {
    var id: String {
        "\(icon)\(iconColor)\(backColor)\(borderColor)"
    }
    var icon: String
    var iconColor: HighColor
    var backColor: BackColor
    var borderColor: HighColor
}

extension OptionModel: Equatable, Hashable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
    
    public static func != (lhs: Self, rhs: Self) -> Bool {
        lhs.id != rhs.id
    }
}
