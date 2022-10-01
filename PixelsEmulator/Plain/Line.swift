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

    init(length: Int, row: Int, dr: CGFloat) {
        self.row = row
        self.length = length
        var pixels = [Pixel]()
        for i in 0..<length {
            pixels.append(Pixel(coord: Coord(x: i, y: row), r: dr))
        }
        self.pixels = pixels
    }

    var body: some View {
        HStack(spacing: 0) {
            ForEach(pixels, id: \.coord) { pixel in
                pixel
            }
        }
                //.animation(.easeInOut)
    }

    mutating func setPixelColor(column: Int, color: Color) {
        //let pre = pixels[column]
        //pixels[column] = Pixel(coord: pre.coord, r: pre.radius, activeColor: color)
        //print(color)
        //pixels.append(Pixel(coord: pre.coord, r: pre.radius, activeColor: color))
        pixels[column].setColor(c: color)

    }
}