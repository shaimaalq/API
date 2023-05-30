
//
//  ContentView.swift
//  API2
//
//  Created by shaima on 10/11/1444 AH.
//

import SwiftUI

class BreakingBad: ObservableObject {
    @Published var quotes: [Quote] = []
    
    func fetchQuotes() async {
        
        
        guard let url = URL(string: "https://api.breakingbadquotes.xyz/v1/quotes/100") else {
            print("Hey Girl THIS url is Not working! ")
            return}
        
        
        do  {
            let (data , _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode([Quote].self, from: data){
                quotes = decodedResponse
            }
    } catch{
          print("bad news... this data is no valid :(")
            
         }}}

