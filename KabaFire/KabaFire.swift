//
//  KabaFire.swift
//  KabaFire
//
//  Created by IPG on 2020/11/22.
//  Copyright © 2020 Taiki Kabaya. All rights reserved.
//

import Foundation
import UIKit

public class KabaFire {
    public static let name = "kabaya"
    
    public static func get<T: Codable>(url: String, model: T.Type, header: [String : String] = [:], completion: @escaping(T) -> Void) {
        self.request(url: url, method: "GET", completion: { value in
                completion(value)
        })
    }
    
    // TODO: bodyに未対応
    public static func post<T: Codable>(url: String, model: T.Type, header: [String : String] = [:], completion: @escaping(T) -> Void) -> Void {
        self.request(url: url, method: "POST", header: header, completion: { value in
            completion(value)
        })
    }
    
    // TODO: bodyに未対応
    public static func put<T: Codable>(url: String, model: T.Type, header: [String : String] = [:], completion: @escaping(T) -> Void) -> Void {
        self.request(url: url, method: "PUT", completion: { value in
            completion(value)
        })
    }
    
    public static func delete<T: Codable>(url: String, model: T.Type, header: [String : String] = [:], completion: @escaping(T) -> Void) -> Void {
        self.request(url: url, method: "DELETE", completion: { value in
            completion(value)
        })
    }
    
    // 現状headerには、Stringしかセット出来ない。
    private static func request<T: Codable>(url: String, method: String, header: [String : String] = [:], completion: @escaping(T) -> Void) {
        let uri = URL(string: url)!
        
        var request = URLRequest(url: uri)
        request.httpMethod = method
        
        // headerを付与
        for (key, value) in header {
            request.setValue(key, forHTTPHeaderField: value)
        }

        let task = URLSession.shared.dataTask(with: uri) {(data, response, error) in
            guard let data = data else { return }
            do {
                let value: T = try JSONDecoder().decode(T.self, from: data)
                    completion(value)
            } catch {
                // noop
            }
        }
        task.resume()
    }
}
