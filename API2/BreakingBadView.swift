//
//  BreakingBadView.swift
//  API2
//
//  Created by shaima on 10/11/1444 AH.
//



import SwiftUI

struct Quote: Codable {
    // var quote_id: Int
    var quote: String
    var author: String
    //var series: String

}
struct BreakingBadView: View {
    @StateObject private var Model = BreakingBad()
    
    var body: some View {
        NavigationView {
            List(Model.quotes, id: \.quote) { quote in
                VStack(alignment: .leading) {
                    Text(quote.quote)
           
                        .font(.body)
                        .foregroundColor(Color("skyBlue"))
                    Text("- \(quote.author)")
                        .font(.caption2)
                }
            }
            .navigationTitle("Breaking Bad ")
            Color.blue
        }
        .onAppear {
            Task {
                await Model.fetchQuotes()
            }
        }
    }
}

struct BreakingBadView_Previews: PreviewProvider {
    static var previews: some View {
        BreakingBadView()
    }
}
