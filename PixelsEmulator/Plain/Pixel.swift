//
// Created by 孔维锐 on 2022/10/1.
//

import Foundation
import SwiftUI

let PixelUnit = Rectangle()

struct Pixel: View {
    let coord: Coord
    //let id: UUID
    private var activeColor: Color
    private var di: CGFloat


    init(coord: Coord, di: CGFloat, activeColor: Color = .accentColor) {
        self.coord = coord
        self.di = di
        self.activeColor = activeColor
        //id = UUID()
    }

    var body: some View {
        PixelUnit
                .size(width: di, height: di)
                .fill(activeColor)
                .animation(.easeInOut)
    }

    mutating func setColor(c: Color) {
        activeColor = c
    }
}