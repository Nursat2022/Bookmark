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
           
            CustomActionSheet(bookmarks: $bookmarks, showActionSheet: $showActionSheet, bookmarkTitle: $bookmarkTitle, bookmarkLink: $bookmarkLink) {
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
        .onAppear {
            if let decodedBookmarks = try? JSONDecoder().decode([bookMark].self, from: bookmarksData) {
                bookmarks = decodedBookmarks
            }
        }
        .background(showActionSheet ? .black.opacity(0.3) : .white)
    }
}

struct CustomActionSheet: View {
    @Binding var bookmarks: [bookMark]
    @Binding var showActionSheet: Bool
    @Binding var bookmarkTitle: String
    @Binding var bookmarkLink: String
    @AppStorage("bookmarks") var bookmarksData: Data = Data()
    var action: () -> Void
    
    var body: some View {
        ZStack(alignment: .bottom) {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(width: UIScreen.main.bounds.width, height: 362)
            
            VStack(alignment: .leading, spacing: 0) {
                header
                    .padding(.vertical, 22)
                
                VStack(spacing: 16) {
                    customTextField(linkOrTitle: $bookmarkTitle, placeHolder: "Bookmark title")
                        .withTitle(title: "Title")
                    
                    customTextField(linkOrTitle: $bookmarkLink, placeHolder: "Bookmark link (URL)")
                        .withTitle(title: "Link")
                }
                .padding(.bottom, 24)
                
                blackButton(text: "Save") {
                    action()
                    do {
                        let encodedBookmarks = try JSONEncoder().encode(bookmarks)
                        bookmarksData = encodedBookmarks
                    } catch {
                        print("Error encoding bookmarks: \(error)")
                    }
                    showActionSheet = false
                    bookmarkTitle = ""
                    bookmarkLink = ""
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 50)
        }
    }
    
    var header: some View {
        HStack {
            Spacer()
            Button(action: { showActionSheet = false }) {
                Image(systemName: "xmark")
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
            }
        }
    }
}

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

//MARK: BOOKMARK
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


struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
