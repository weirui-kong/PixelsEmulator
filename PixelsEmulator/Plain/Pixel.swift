//
// Created by 孔维锐 on 2022/10/1.
//

import Foundation
import SwiftUI

struct Pixel: View, Identifiable {
    let coord: Coord
    let id: UUID
    var activeColor: Color
    var radius: CGFloat

    init(coord: Coord, r: CGFloat) {
        self.coord = coord
        radius = r
        activeColor = Color.gray
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
        Circle()
                .size(width: radius, height: radius)
                .fill(activeColor)
    }
    mutating func setColor(c: Color){
        activeColor = c
    }
}