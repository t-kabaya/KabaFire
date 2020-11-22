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
    
    public static func get<T: Codable>(url: String, model: T.Type, completion: @escaping(T) -> Void) {
            let uri = URL(string: url)!
            let request = URLRequest(url: uri)
            
            self.request(uri: uri, request: request, completion: { value in
                completion(value)
            })
    }
    
    private static func request<T: Codable>(uri: URL, request: URLRequest, completion: @escaping(T) -> Void) {
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
    
//    public static func post<T: Codable>(url: String) -> Void {
//        let uri = URL(string: url)
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST" // この一行がないとGetになる
//
//        let task = URLSession.shared.dataTask(with: uri) {(data, response, error) in
//        guard let data = data else { return }
//
//            let value: T = try JSONDecoder().decode(T.self, from: data)
//            completion(value)
//        } catch {
//            // noop
//        }
//    }
//
//    public static func put() {
//
//    }
//
//    public static func delete() {
//
//    }
    
//    private static func decode<T>(json: String) -> T {
//
//    }
//
    
}
