//
//  ArticalView.swift
//  AnasNewsTask
//
//  Created by mac on 12/08/2023.
//

import SwiftUI
import SDWebImageSwiftUI
import UIKit
struct ArticalView: View {
    var artical:Article
    var body: some View {
        HStack{
            WebImage(url:extractImage())
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100,height: 100)
                .cornerRadius(20)
            
            Text(artical.title)
                .multilineTextAlignment(.leading)
                .foregroundColor(Theme.textColor)
                .font(.system(size: 14, weight: .semibold))
                .lineLimit(2)
            Spacer(minLength: 0)
        }
        .padding()
    
    }
    
    func extractImage()-> URL?{
        if let urlString = artical.urlToImage {
            return URL(string: urlString)
        }
        return  URL(string: "https://images.ctfassets.net/pdf29us7flmy/hjhhSuDSWZ5KjrMYTijB0/8c12318f2ee0f1ab8859a90ffc0e15c6/-IND-004-075-_APA_Headings__Formatting_Tips_and_Examples_Final.png?w=720&q=100&fm=avif")
    }
    
    
    func extractUrl() -> URL{
        return URL(string: artical.url)!
    }
}
