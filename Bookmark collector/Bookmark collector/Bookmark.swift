//
//  Bookmark.swift
//  Bookmark collector
//
//  Created by Nursat Sakyshev on 02.08.2023.
//

import SwiftUI

struct bookMark: View, Identifiable, Codable {
    var id: Int
    var title: String
    var link: String
    var body: some View {
        Link(destination: URL(string: link)!) {
        HStack {
                Text(title)
                Spacer()
                Image("Group")
            }
        }
        .foregroundColor(.black)
    }
}
