//
//  ContentView.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/04/19.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {

                MainTabView()
                    .navigationBarHidden(showMenu)
//                    .offset(x: showMenu ? 250 : 0, y: 0)
//                    .onTapGesture {
//                        withAnimation {
//                            showMenu = false
//
//                        }
//                    }
                    
                
                if showMenu {
                    ZStack {
                        Color(.black)
                            .opacity(0.5)
                    }
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            showMenu = false
                        }
                    }
                }
                
                SideMenuView()
                    .frame(width: 250)
                    .offset(x: showMenu ? 0 : -250, y: 0)
                    .background(showMenu ?  Color.white : Color.clear)
                    
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        withAnimation {
                            self.showMenu.toggle()
                        }
                    } label: {
                        Circle()
                            .frame(width: 32, height: 32)
                    }

                }
            }
            .onAppear{
                showMenu = false
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
