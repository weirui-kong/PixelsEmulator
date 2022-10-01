//
// Created by 孔维锐 on 2022/10/1.
//

import Foundation
import SwiftUI
let PixelUnit = Rectangle()

struct Pixel: View, Identifiable {
    let coord: Coord
    let id: UUID
    private var activeColor: Color
    private var radius: CGFloat

    init(coord: Coord, r: CGFloat) {
        self.coord = coord
        radius = r
        activeColor = .gray.opacity(0.5)
        id = UUID()
    }

    init(coord: Coord, r: CGFloat, activeColor: Color) {
        self.coord = coord
        radius = r
        self.activeColor = activeColor
        id = UUID()
        //print(activeColor)
    }

    var body: some View {
        PixelUnit
                .size(width: radius, height: radius)
                .fill(activeColor)
    }

    mutating func setColor(c: Color){
        activeColor = c
    }
}