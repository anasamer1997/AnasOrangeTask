//
//  news_interactor.swift
//  AnasNewsTask
//
//  Created by mac on 12/08/2023.
//

import Foundation
import Combine
class Newsinteractor:ObservableObject{
    @Published var searchQuery = ""
    @Published var fetchedNews:[Article]? = nil
    
    var cancellables = Set<AnyCancellable>()
    var cancellable:AnyCancellable? = nil
    init(){
        cancellable = $searchQuery
            .removeDuplicates()
            .debounce(for: 0.6, scheduler: RunLoop.main)
            .sink(receiveValue: { str in
                if str == ""{
                    // reset data
                    self.fetchedNews = nil
                }else{
                    //search
                    self.searchNews()
                }
            })
        
    }
    
    
    func searchNews(){
        let originalQuery = searchQuery.replacingOccurrences(of: " ", with: "%20")
        NetworkService.shared.request(originalQuery: originalQuery,response: News.self)
            .sink { _ in
                
            } receiveValue: { [weak self] data in
                DispatchQueue.main.async {
                    self?.fetchedNews = data.articles
                }
               
            }.store(in: &cancellables)
        

    }
}
