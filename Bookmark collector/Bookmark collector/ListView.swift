//
//  ListView.swift
//  Bookmark collector
//
//  Created by Nursat Sakyshev on 05.04.2023.
//

import SwiftUI

struct ListView: View {
    var image = Image("Group")
    var body: some View {
        VStack {
            Text("List")
                .padding(.top, 10)
                .padding(.bottom, 20)
            Group {
                HStack {
                    Text("Google")
                    Spacer()
                    image
                }
                
                Divider()
                
                HStack {
                    Text("nFactorial School")
                    Spacer()
                    image
                }
                
                Divider()
            
                HStack {
                    Text("NY Times")
                    Spacer()
                    image
                }
                
                Divider()
                
                HStack {
                    Text("Bloomberg")
                    Spacer()
                    image
                }
                Divider()
            
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 11)
            
            Spacer()
            
            Button(action: {}) {
                Text("Add bookmark")
                    .foregroundColor(.white)
            }
            .frame(width: 358, height: 58)
            .background(Color.black)
            .cornerRadius(16)
            .padding(.bottom, 50)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
