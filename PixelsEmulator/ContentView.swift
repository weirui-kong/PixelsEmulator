//
//  ContentView.swift
//  PixelsEmulator
//
//  Created by 孔维锐 on 2022/10/1.
//
//

import SwiftUI

struct ContentView: View {
    @State var plane = Plane(w: 60, h: 80, dr: 10)
    var body: some View {
        ZStack {
            VStack {
                plane
            }
            Button("init") {
                DispatchQueue.global().async {
                    var of = 1
                    while true {
                        of += 10
                        sleep(1)
                        plane.drawLine(x1: 0, y1: 0, x2: 0 + of, y2: 80)
                    }

                }
                //plane.drawLine(x1: 0, y1: 0, x2: 10, y2: 60)
            }
                    .background(Color.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
