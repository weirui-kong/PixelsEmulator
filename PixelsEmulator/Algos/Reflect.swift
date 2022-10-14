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

    static func reflectAcross_Y(coords: [Coord]) -> [Coord] {
        var reflect = [Coord]()
        for coord in coords {
            reflect.append(Coord(x: 0 - coord.x, y: coord.y))
        }
        return reflect
    }

    static func reflectAcross_Y_centered(coords: [Coord]) -> [Coord] {
        var x_min: Coord = coords.first!
        var x_max: Coord = coords.first!
        for coord in coords {
            if coord.x < x_min.x {
                x_min = coord
            }
            if coord.x > x_max.x {
                x_max = coord
            }
        }
        let offset = (x_max.x - x_min.x) / 2 + x_min.x
        var offset_ = coords
        offset_ = Move.move(coords: offset_, x: 0 - offset)
        var reflect = coords
        for coord in offset_ {
            reflect.append(Coord(x: 0 - coord.x, y: coord.y))
        }
        reflect = Move.move(coords: offset_, x: offset)
        return reflect
    }

    static func reflectAcross_X(coords: [Coord]) -> [Coord] {
        var reflect = [Coord]()
        for coord in coords {
            reflect.append(Coord(x: coord.x, y: 0 - coord.y))
        }
        return reflect
    }
}