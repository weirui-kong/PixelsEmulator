//
// Created by 孔维锐 on 2022/10/1.
//

import Foundation
import SwiftUI


struct Line: View {
    //temporarily set to horizontal
    let row: Int
    let length: Int
    private var pixels: [Pixel]

    init(length: Int, row: Int, di: CGFloat) {
        self.row = row
        self.length = length
        var pixels = [Pixel]()
        for i in 0..<length {
            pixels.append(Pixel(coord: Coord(x: i, y: row), di: di))
        }
        self.pixels = pixels
    }

    var body: some View {
        HStack(spacing: 0) {
            ForEach(pixels, id: \.coord) { pixel in
                pixel
            }
        }
    }


    mutating func setPixelColor(column: Int, color: Color) {
        pixels[column].setColor(c: color)

    }
}