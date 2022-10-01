//
//  ContentView.swift
//  PixelsEmulator
//
//  Created by 孔维锐 on 2022/10/1.
//
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MyPlane(w: 50, h: 50, di: 10)
    }

}

struct MyPlane: View {

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
            HStack {
                Button("init") {
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
                Button("reset") {
                    plane.reset()
                }
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
