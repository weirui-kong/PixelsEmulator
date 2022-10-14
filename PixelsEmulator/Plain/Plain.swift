//
// Created by 孔维锐 on 2022/10/1.
//

import Foundation
import SwiftUI


struct Plane: View {
    let id: UUID
    let width: Int
    let height: Int
    let defaultDiameter: CGFloat
    private var lines: [Line]

    init(w: Int, h: Int, di: CGFloat) {
        id = UUID()
        height = h
        width = w
        defaultDiameter = di
        var lines = [Line]()
        for n in 0..<height {
            lines.append(Line(length: width, row: n, di: defaultDiameter))
        }
        self.lines = lines
    }

    var body: some View {
        VStack(spacing: 0) {
            ForEach(lines, id: \.row) { line in
                line
            }
        }
    }


    mutating func reset() {
        var lines = [Line]()
        for n in 0..<height {
            lines.append(Line(length: width, row: n, di: defaultDiameter))
        }
        self.lines = lines
    }

    mutating func setPixelColor(coord: Coord, c: Color) {
        if (coord.x >= 0 && coord.y >= 0 && coord.x < width && coord.y < height) {
            lines[coord.y].setPixelColor(column: coord.x, color: c)
        } else {
            //print("invalid coord")
        }

    }

    mutating func drawPixels(coords: [Coord], c: Color, withDelay: Bool = false) {
        if !withDelay {
            for coord in coords {
                setPixelColor(coord: coord, c: c)
            }
        } else {
            for coord in coords {
                //had to be finished
                setPixelColor(coord: coord, c: c)
            }

        }

    }

    mutating func drawLine(x1: Int, y1: Int, x2: Int, y2: Int, c: Color = .red, withDelay: Bool = false) {
        //bresenham method

        let k: Double = Double(y2 - y1) / Double(x2 - x1)
        //print(k)
        var coords = [Coord]()
        if k <= 1 {
            for x in x1...x2 {
                let y = Double(x) * k
                let dy = y - Double(Int(y))
                if dy >= 0.5 {
                    coords.append(Coord(x: x, y: Int(Double(x) * k) + 1))
                } else {
                    coords.append(Coord(x: x, y: Int(Double(x) * k)))
                }
            }
        } else {
            let _x1 = y1
            let _x2 = y2
            let _k = 1 / k
            for x in _x1..._x2 {
                let y = Double(x) * _k
                let dy = y - Double(Int(y))
                //print(x, y, dy)
                if dy >= 0.5 {
                    coords.append(Coord(x: x, y: Int(Double(x) * _k) + 1))
                } else {
                    coords.append(Coord(x: x, y: Int(Double(x) * _k)))
                }
            }
            coords = Reflect.reflectAcross_Y_X(coords: coords)
        }
        drawPixels(coords: coords, c: c, withDelay: true)
    }


}



