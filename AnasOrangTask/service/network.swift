//
//  network.swift
//  AnasNewsTask
//
//  Created by mac on 17/08/2023.
//

import Foundation
import Combine
enum APIError: Error {
    case invalidResponse
    case invalidData
}

class NetworkService{
    static let shared = NetworkService()
    private let apiKey = "362898cd95d34ff2a7f812991d6b92f5"
    private let cancellable = Set<AnyCancellable>()
    
    func request<T:Decodable>(originalQuery:String,response: T.Type)-> AnyPublisher<T,Error>{
        let url = URL(string: "https://newsapi.org/v2/everything?q=\(originalQuery)&from=2023-08-11&sortBy=publishedAt&apiKey=\(apiKey)")!
        let request = URLRequest(url: url)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    throw APIError.invalidResponse
                }
                
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String:Any]{
                    RealmManager.shared.saveData(json: object)
                }
               
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    
}
