//
// Created by 孔维锐 on 2022/10/13.
//

import Foundation
import SwiftUI

class ShapeEmulated: NSCopying {
    var coords: [Coord]
    var color: Color

    init(color: Color) {
        self.coords = [Coord]()
        self.color = color
    }

    func move(x: Int = 0, y: Int = 0) {
        coords = Move.move(coords: coords, x: x, y: y)
    }

    func copy(with zone: NSZone? = nil) -> Any {
        let copy = ShapeEmulated(color: self.color)
        return copy
    }
    func reflectAcross_Y_centered(){
        coords = Reflect.reflectAcross_Y_centered(coords: coords)
    }
}

class RectangleEmulated: ShapeEmulated {

    var topLeading: Coord
    var bottomTrailing: Coord

    init(topLeading tl: Coord, bottomTrailing bt: Coord, color: Color) {
        topLeading = tl
        bottomTrailing = bt
        super.init(color: color)
        for i in tl.x...bt.x {
            coords.append(Coord(x: i, y: tl.y))
            coords.append(Coord(x: i, y: bt.y))
        }
        //this will cause redundant pixels
        //to be enhanced
        for i in tl.y...bt.y {
            coords.append(Coord(x: tl.x, y: i))
            coords.append(Coord(x: bt.x, y: i))
        }
    }

    override func move(x: Int = 0, y: Int = 0) {
        super.move(x: x, y: y)
        topLeading = Coord(x: topLeading.x + x, y: topLeading.y + y)
        bottomTrailing = Coord(x: bottomTrailing.x + x, y: bottomTrailing.y + y)
    }

    override func copy(with zone: NSZone? = nil) -> Any {
        let copy = RectangleEmulated(topLeading: topLeading, bottomTrailing: bottomTrailing, color: color)
        return copy
    }
    override func reflectAcross_Y_centered(){
        coords = Reflect.reflectAcross_Y_centered(coords: coords)
        //swap(&topLeading, &bottomTrailing)
    }
}

class LineEmulated: ShapeEmulated{

}