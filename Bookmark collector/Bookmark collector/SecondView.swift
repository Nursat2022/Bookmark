//
//  SecondView.swift
//  Bookmark collector
//
//  Created by Nursat Sakyshev on 04.04.2023.
//

import SwiftUI

struct SecondView: View {
    @State private var bookmarks: [bookMark] = []
    @State private var addBookmark: Bool = true
    @State private var showActionSheet = false
    @State private var bookmarkTitle = ""
    @State private var bookmarkLink = ""
    @State private var selectedBookmark: bookMark?
    @State private var indexToChange = 0
    @AppStorage("bookmarks") var bookmarksData: Data = Data()
    

    var body: some View {
        ZStack(alignment: .bottom) {
                VStack {
                    if bookmarks.isEmpty {
                        Text("Bookmark App")
                            .font(.system(size: 17))
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Text("Save your first \nbookmark")
                            .font(.system(size: 34))
                            .fontWeight(.bold)
                            .lineSpacing(10)
                            .frame(width: 358, height: 92)
                            .multilineTextAlignment(.center)
                    }
                    else {
                        ListView(bookmarks: $bookmarks, showActionSheet: $showActionSheet, bookmarkTitle: $bookmarkTitle, bookmarkLink: $bookmarkLink, addBookmark: $addBookmark, indexToChange: $indexToChange)
                    }
                    
                    Spacer()
                    
                    blackButton(text: "Add bookmark") {
                        showActionSheet = true
                    }
                    
                }
                .padding(.top, 56)
                .padding(.bottom,50)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
           
            CustomBottomSheet(bookmarks: $bookmarks, showActionSheet: $showActionSheet, bookmarkTitle: $bookmarkTitle, bookmarkLink: $bookmarkLink) {
                if bookmarkTitle != "" && bookmarkLink != "" {
                    if addBookmark {
                        bookmarks.append(bookMark(id: bookmarks.count, title: bookmarkTitle, link: bookmarkLink))
                    }
                    else {
                        bookmarks[indexToChange].title = bookmarkTitle
                        bookmarks[indexToChange].link = bookmarkLink
                    }
                }
            }
                .offset(y: showActionSheet ? 0 : UIScreen.main.bounds.height)
                .animation(.spring(), value: showActionSheet)
        }
        .background(showActionSheet ? .black.opacity(0.3) : .white)
        .onAppear {
            if let decodedBookmarks = try? JSONDecoder().decode([bookMark].self, from: bookmarksData) {
                bookmarks = decodedBookmarks
            }
        }
    }
}

//MARK: EXTENSION
extension View {
    func withTitle(title: String) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
            self
        }
    }
}

struct blackButton: View {
    var text: String
    var action: () -> ()
    var body: some View {
        Button(action: action) {
            Text(text)
                .frame(width: 310)
        }
        .foregroundColor(.white)
        .frame(width: 358, height: 58)
        .background(Color.black)
        .cornerRadius(16)
    }
}


struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}

//MARK: HIDE KEYBOARD
func hideKeyboard() {
    let resign = #selector(UIResponder.resignFirstResponder)
    UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
}
