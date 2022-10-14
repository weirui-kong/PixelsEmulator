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
        MyPlane1(w: 100, h: 100, di: 5)
        //ShapesContainablePlain(w: 100, h: 100, di: 5)
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
