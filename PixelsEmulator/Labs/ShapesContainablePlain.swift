//
// Created by 孔维锐 on 2022/10/13.
//

import Foundation
import SwiftUI

struct ShapesContainablePlain: View {
    let w: Int
    let h: Int
    let di: CGFloat
    @State var plane: Plane
    @State var shapes: [ShapeEmulated] {
        didSet {
            updatePixelsView()
        }
    }

    init(w: Int, h: Int, di: CGFloat) {
        self.w = w
        self.h = h
        self.di = di
        _plane = State.init(wrappedValue: Plane(w: w, h: h, di: di))
        _shapes = State.init(wrappedValue: [ShapeEmulated]())
    }

    @State var counter = 0
    var body: some View {
        ZStack {
            plane
            VStack {
                Spacer()
                VStack {
                    Button("画一个长方形") {
                        shapes.append(
                                RectangleEmulated(
                                        topLeading: Coord(x: 10, y: 10),
                                        bottomTrailing: Coord(x: 30, y: 20),
                                        color: .red)
                        )

                    }
                    Button("右移15个像素") {
                        let pre = shapes.last!.copy() as! RectangleEmulated
                        pre.move(x: 15)
                        pre.color = pre.color.opacity(0.8)
                        shapes.append(pre)

                    }
                    Button("下移15个像素") {
                        let pre = shapes.last!.copy() as! RectangleEmulated
                        pre.move(y: 15)
                        pre.color = pre.color.opacity(0.8)
                        shapes.append(pre)
                    }
                    Button("以图形中心水平翻转") {
                        let pre = shapes.last!.copy() as! RectangleEmulated
                        pre.reflectAcross_Y_centered()
                        pre.color = pre.color.opacity(0.8)
                        shapes.append(pre)
                    }
                    Button("清空") {
                        shapes.removeAll()
                    }

                }
            }
        }

    }

    func updatePixelsView() {
        plane.reset()
        for s in shapes {
            for p in s.coords {
                plane.setPixelColor(coord: p, c: s.color)
            }
        }
    }

}
