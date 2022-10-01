//
// Created by 孔维锐 on 2022/10/1.
//

import Foundation

struct Reflect {
    static func reflectAcross_Y_X(coords: [Coord]) -> [Coord] {
        var reflect = [Coord]()
        for coord in coords {
            reflect.append(Coord(x: coord.y, y: coord.x))
        }
        return reflect
    }
}