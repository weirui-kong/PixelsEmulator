//
// Created by 孔维锐 on 2022/10/13.
//

import Foundation

struct Move {
    static func move(coords: [Coord], x: Int = 0, y: Int = 0) -> [Coord] {
        var reflect = [Coord]()
        for coord in coords {
            reflect.append(Coord(x: coord.x + x, y: coord.y + y))
        }
        return reflect
    }

}