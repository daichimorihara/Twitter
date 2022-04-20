//
//  SideMenuRowView.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/04/20.
//

import SwiftUI

struct SideMenuRowView: View {
    let vm: SideMenuViewModel
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: vm.imageName)
                .font(.headline)
                .foregroundColor(.gray)
            
            Text(vm.title)
                .font(.subheadline)
                .foregroundColor(.black)
            
            Spacer()
        }
    }
}

struct SideMenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuRowView(vm: SideMenuViewModel.bookmarks)
    }
}
