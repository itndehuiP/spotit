//
//  ButtonsRow.swift
//  spotit WatchKit Extension
//
//  Created by Guerson Perez on 16/05/21.
//

import SwiftUI

struct ButtonsRow: View {
    var leftOption: OptionModel?
    let rightOption: OptionModel?
    let optionWidth: CGFloat
    
    var body: some View {
        HStack {
            leftButton
            Spacer()
            rightButton
        }
    }
}

extension ButtonsRow {
    private var leftButton: some View {
        button(for: leftOption)
    }
    
    private var rightButton: some View {
        button(for: rightOption)
    }
    
    private func button(for option: OptionModel?) -> some View {
        Group {
            if let option = option {
                OptionButton(option: option,
                             width: optionWidth)
            }
        }
    }
}

struct ButtonsRow_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsRow(leftOption: OptionModel(icon: Icon.bell,
                                           backColor: .four,
                                           borderColor: .three),
                   rightOption: OptionModel(icon: Icon.flame,
                                            backColor: .two,
                                            borderColor: .three),
                   optionWidth: 100)
    }
}
