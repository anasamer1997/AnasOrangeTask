//
//  NewsResponse.swift
//  AnasNewsTask
//
//  Created by mac on 12/08/2023.
//

import Foundation

struct News:Decodable{
    let status: String
    let articles: [Article]
}

// MARK: - Article
struct Article :Decodable{
    let source: Source
    let author: String?
    let title:String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String
//    private enum CodingKeys: String, CodingKey {
//        case source ,auther , title,descrption,url,urlToImage,publishedAt,content
//    }
}

// MARK: - Source
struct Source:Decodable,Identifiable {
    let id = UUID()
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case name
    }
}
