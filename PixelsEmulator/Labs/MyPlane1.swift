//
// Created by 孔维锐 on 2022/10/13.
//

import Foundation
import SwiftUI

struct MyPlane1: View {

    let w: Int
    let h: Int
    let di: CGFloat
    @State var plane: Plane

    //manually specify width,

    init(w: Int, h: Int, di: CGFloat) {
        self.w = w
        self.h = h
        self.di = di
        _plane = State(initialValue: Plane(w: w, h: h, di: di))
    }

    var body: some View {
        ZStack {
            VStack {
                plane
            }
            VStack{
                Spacer()
                HStack {
                    Button("test_draw", action: test_draw)
                    Button("reset") {
                        plane.reset()
                    }
                }

            }

        }
    }
    func test_draw(){
        //test
        DispatchQueue.global().async {
            var of = 0
            while true {
                plane.drawLine(x1: 0, y1: 0, x2: 0 + of, y2: h)
                of += 10
                if of > w {
                    break
                }
            }

        }
    }

}