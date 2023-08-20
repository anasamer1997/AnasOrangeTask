//
//  ContentView.swift
//  AnasNewsTask
//
//  Created by mac on 12/08/2023.
//

import SwiftUI
import CoreData

struct HomeScreen: View {
    @StateObject var newsData = Newsinteractor()
//    @StateObject var networkHelper = NetworkHelper()
    @EnvironmentObject var networkMonitor: NetworkHelper
    var body: some View {
        NavigationView {
            
            ScrollView (.vertical,showsIndicators: false){
                    VStack (spacing: 25){
                        HStack(spacing: 15){
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            TextField("Search",text: $newsData.searchQuery)
                                .textInputAutocapitalization(.none)
                                .autocorrectionDisabled(true)
                                .foregroundColor(.black)
                        }
                        
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .background(.white)
                        .cornerRadius(20)
                        .shadow(color:Color.black.opacity(0.08),radius:5,x: 5,y: 5)
                        .shadow(color:Color.black.opacity(0.08),radius:5,x: -5,y: -5)
                        
                    }
                    .padding()
               
             
                if let news = newsData.fetchedNews{
                    if news.isEmpty{
                        Text("No Result Found !!!")
                            .foregroundColor(Theme.textColor)
                            .padding(.top,20)
                    }else{
                        
                        ForEach(news,id: \.source.id) { artical in
                            NavigationLink {
                               
                                ArticalDetails(artical: artical)
                            } label: {
                                ArticalView(artical: artical)
                            }

                            
                        }
                    }
                }else{
                    if newsData.searchQuery != ""{
                        ProgressView()
                            .padding(.top,20)
                    }
                }
            }
            .navigationTitle("News")
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
