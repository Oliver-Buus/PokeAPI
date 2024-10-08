//
//  NetworkService.swift
//  PokeAPI
//
//  Created by dmu mac 24 on 18/09/2024.
//

import Foundation

class NetworkService {
    static func getData(from url: URL) async -> Data? {
        let session = URLSession.shared
        do {
            let (data, response) = try await session.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse else {return nil}
            if httpResponse.statusCode != 200 {
                fatalError("Noget gik galt med noget")
            }
            return data
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
