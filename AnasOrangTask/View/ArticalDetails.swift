//
//  ArticalDetails.swift
//  AnasNewsTask
//
//  Created by mac on 16/08/2023.
//

import SwiftUI
import SDWebImageSwiftUI
struct ArticalDetails: View {
    let artical:Article
    var title = ""
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            VStack(alignment: .leading,spacing: 10) {

                WebImage(url:extractURLToImage())
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width * 0.9,height: 200)
                    .cornerRadius(20)
                
                Text(artical.title)
                    .foregroundColor(Theme.textColor)
                    .font(.system(size: 18, weight: .semibold))
                
                Text(artical.description ?? "No description")
                    .foregroundColor(Theme.textColor)
                    .font(.system(size: 14, weight: .regular))

                Text(artical.content)
                    .foregroundColor(Theme.textColor)
                    .font(.system(size: 16, weight: .regular))
                Spacer()
                Text("Author : \(artical.author ?? "unknown")")
                    .foregroundColor(Theme.textColor)
                    .font(.system(size: 12, weight: .semibold))
                
                NavigationLink {
                    WebView(url: URL(string: artical.url)!)
                } label: {
                    Capsule()   
                        .frame(width: 150,height: 40)
                        .overlay {
                            Text("Source : \(artical.source.name)")
                                .foregroundColor(Theme.textColor)
                                .font(.system(size: 12, weight: .semibold))
                        }
                        .foregroundColor(.accentColor)
                }
            }
            .foregroundColor(Theme.textColor)
            .padding(.horizontal)
        }
    }
    func extractURLToImage()-> URL?{
        if let urlString = artical.urlToImage {
            return URL(string: urlString)
        }
        return  URL(string: "https://images.ctfassets.net/pdf29us7flmy/hjhhSuDSWZ5KjrMYTijB0/8c12318f2ee0f1ab8859a90ffc0e15c6/-IND-004-075-_APA_Headings__Formatting_Tips_and_Examples_Final.png?w=720&q=100&fm=avif")
    }
}

//struct ArticalDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        ArticalDetails()
//    }
//}
