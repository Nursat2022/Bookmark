//
//  customTextField.swift
//  Bookmark collector
//
//  Created by Nursat Sakyshev on 06.08.2023.
//

import SwiftUI

struct customTextField: View {
    @Binding var linkOrTitle: String
    var placeHolder: String
    var body: some View {
        TextField(placeHolder, text: $linkOrTitle)
            .padding(17)
            .accentColor(.yellow)
            .frame(width: 358, height: 46)
            .background(Color(red: 242/255, green: 242/255, blue: 238/255))
            .cornerRadius(16)
    }
}
