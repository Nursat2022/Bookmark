//
//  ListView.swift
//  Bookmark collector
//
//  Created by Nursat Sakyshev on 05.04.2023.
//

import SwiftUI

struct ListView: View {
    @Binding var bookmarks: [bookMark]
    var image = Image("Group")
    var body: some View {
        VStack {
            Text("List")
                .fontWeight(.bold)
            List(bookmarks) { bookmark in
                bookmark
                    .listRowInsets(EdgeInsets(top: 11, leading: 16, bottom: 11, trailing: 16))
                    .padding(.top, 28)
            }
            .listStyle(.plain)
        }
    }
}

