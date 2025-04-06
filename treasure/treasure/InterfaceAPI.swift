//
//  InterfaceAPI.swift
//  treasure
//
//  Created by Lukas Cao on 4/6/25.
//

import Foundation

var InterfaceAPI = MyInterfaceAPI()

struct VideoMetaData: Decodable {
    let _id: String
    let videoKey: String
    let likeCount: String
    let caption: String
    let author: String
    let createdAt: String
    let updatedAt: String
    let __v: Int
    let video: String
    let id: String

    // Use CodingKeys to match the JSON keys to the struct properties
    enum CodingKeys: String, CodingKey {
        case _id, videoKey, likeCount, caption, author, createdAt, updatedAt, __v, video, id
    }
}

class MyInterfaceAPI {
    private let domain: String = "twibit.us/"
    
    func process_get_request(endpoint: String, completion: @escaping (Data?) -> Void) {
        var request = URLRequest(url: URL(string: "https://\(domain)\(endpoint)")!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Return if error exists
            if let error = error {
                print("Some Error: \(error.localizedDescription)")
                completion(nil); return
            }
            // Return if response is not HTTP
            guard let httpResponse = response as? HTTPURLResponse else {
                print("No HTTP response")
                completion(nil); return
            }
            // Check If Data was Received
            guard let data = data else {
                print("No data received")
                completion(nil); return
            }
            completion(data)
        }
        task.resume()
    }
    
    func getVideoMixes() -> [VideoMetaData]? {
        process_get_request(endpoint: "api/videos", completion: { data in
            guard let data = data else { return }
            if let jsons = try? JSONDecoder().decode([VideoMetaData].self, from: data) {
                print(jsons)
            }
        })
        return nil
    }
}
