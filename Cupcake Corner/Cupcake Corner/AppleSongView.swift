//
//  AppleSongView.swift
//  Cupcake Corner
//
//  Created by Colten Glover on 10/25/23.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var message: String
}

struct AppleSongView: View {
    @State private var results = [Result]()
    @State private var result = Result(message: "")
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
                image
                    .resizable()
                    .scaledToFit()
                
            } placeholder: {
                ProgressView()
            }
            .frame(width: 200, height: 200)
        }
        .task {
            //await loadData()
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://techy-api.vercel.app/api/json") else {
            print("Invalid URL")
            return
        }
        
        do {
            print("in do")
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(Result.self, from: data) {
                print("decoded")
                result.message = decodedResponse.message
                print("Loaded!")
            }
        } catch {
            print("Invalid data")
        }
        
        
    }
}

#Preview {
    AppleSongView()
}
