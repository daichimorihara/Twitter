//
//  ContentView.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/04/19.
//

import SwiftUI

struct ContentView: View {
    @State private var number = 1
    var body: some View {
        VStack {
            Text("AAA")
                .font(.system(size: 30))
                .frame(width: 90, height: 90)
                .background(.red)
                .offset(x: 100, y: 100)
                .background(.blue)
                .onTapGesture {
                    self.number += 1
                }
            
            
            Text(String(number))
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
