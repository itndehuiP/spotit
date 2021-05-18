//
//  OptionModel.swift
//  spotit WatchKit Extension
//
//  Created by Guerson Perez on 16/05/21.
//

import Foundation

struct OptionModel {
    var id: String {
        "\(icon)\(backColor.rawValue)\(borderColor.rawValue)"
    }
    var icon: String
    var iconColor: StyleColor
    var backColor: StyleColor
    var borderColor: StyleColor
}

extension OptionModel: Equatable, Hashable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
    
    public static func != (lhs: Self, rhs: Self) -> Bool {
        lhs.id != rhs.id
    }
}
