//
//  CustomInputField.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/04/21.
//

import SwiftUI

struct CustomInputField: View {
    let imageName: String
    let placeholderText: String
    @Binding var text: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                TextField(placeholderText, text: $text)
                    .textInputAutocapitalization(.never)
            }
            
            Divider()
                .background(Color(.darkGray))

        }
    }
}

struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(imageName: "", placeholderText: "YES", text: .constant(""))
    }
}