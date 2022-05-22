//
//  ApiService.swift
//  WeGoTripFeedback
//
//  Created by n3deep on 19.05.2022.
//

import Foundation

protocol ApiServicing {
    func sendFeedback(_ feedback: Feedback, onSuccess: @escaping () -> Void, onFailure: @escaping (String) -> Void)
}

class ApiService: ApiServicing {
    static let shared = ApiService()
    
    let apiURL: String = "https://webhook.site"
    
    func sendFeedback(_ feedback: Feedback, onSuccess: @escaping () -> Void, onFailure: @escaping (String) -> Void) {
        
        guard let feedbackJSON = try? JSONEncoder().encode(feedback) else {
            return
        }
        
        let endpoint = "/c8f2041c-c57e-433f-853f-1ef739702903"
        //let endpoint = "/1f248e7c-f2ad-46a4-9b6e-f6151faa36e2"
        
        guard let url = URL(string: apiURL + endpoint) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                
        let task = URLSession.shared.uploadTask(with: request, from: feedbackJSON) { data, response, error in
                if let error = error {
                    print ("error: \(error)")
                    onFailure(error.localizedDescription)
                }
                guard let response = response as? HTTPURLResponse,
                    (200...299).contains(response.statusCode) else {
                    print ("server error")
                    onFailure("server error")
                    return
                }
                if let mimeType = response.mimeType,
                    mimeType == "application/json",
                    let data = data,
                    let dataString = String(data: data, encoding: .utf8) {
                    print ("server answer: \(dataString)")
                    onSuccess()
                }
                onSuccess()
            }
        task.resume()
    }
}
