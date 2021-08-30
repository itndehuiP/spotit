//
//  PickingView.swift
//  spotit WatchKit Extension
//
//  Created by Guerson Perez on 21/08/21.
//

import SwiftUI

struct PickingView: View {
    @ObservedObject var logic: GameLogic
    let size: CGSize
    
    var body: some View {
        pickingView(geoSize: size)
    }
    
    private func pickingView(geoSize: CGSize) -> some View {
        let count = logic.options.count
        let distributor = GridLayerDistributor(optionsCount: count) ?? GridLayerDistributor()
        let distributionInfo = distributor.getLayerDistribution(totalSize: size)
        let eachWidth = distributionInfo.eachSize.width
        let items: [GridItem] = Array(repeating: .init(.fixed(eachWidth), spacing: 2, alignment: .center), count: distributionInfo.columns)
        return LazyVGrid(columns: items) {
            ForEach(0..<count, id: \.self) { index in
                if let opt = logic.option(for: index) {
                    OptionView(option: opt, width: nil)
                    .padding()
                }
            }
        }
    }
}

struct PickingView_Previews: PreviewProvider {
    static var previews: some View {
        PickingView(logic: GameLogic(), size: CGSize(width: 20, height: 20))
    }
}
