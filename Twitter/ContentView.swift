//
//  ContentView.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/04/19.
//

import SwiftUI
import Kingfisher


struct ContentView: View {
    @State private var showMenu = false
    @EnvironmentObject var vm: AuthViewModel

    var body: some View {
        NavigationView {
            Group {
                if vm.userSession == nil {
                    LoginView()
                } else {
                    mainInterfaceView
                }


            }
        }
    }
}

extension ContentView {

    var mainInterfaceView: some View {
        ZStack(alignment: .topLeading) {

            MainTabView()
                .navigationBarHidden(showMenu)

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
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                if let user = vm.currentUser {
                    Button {
                        withAnimation {
                            self.showMenu.toggle()
                        }
                    } label: {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 36, height: 36)
                            .clipShape(Circle())
                    }
                }
            }
        }
        .onAppear{
            showMenu = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
