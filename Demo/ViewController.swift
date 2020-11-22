//
//  ViewController.swift
//  Demo
//
//  Created by IPG on 2020/11/22.
//  Copyright © 2020 Taiki Kabaya. All rights reserved.
//

import UIKit
import KabaFire

struct People: Codable {
    let name: String?
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "https://swapi.dev/api/people/1/"
        KabaFire.get(url: url, model: People.self, completion: { response in
            print(response)
        })
        
        let str = """
            {"name": "Robert", "age" : 35}
            """

        let data = str.data(using: .utf8)
        let jsonParser = JSONParser(data: data!, model: TestModel.self)
    }
}

class JSONParser: NSObject {
    let newJSONDecoder : JSONDecoder
    let data : Data

    init<T: Codable>(data: Data, model: T.Type) {
        self.newJSONDecoder = JSONDecoder()
        do {
        let result = try self.newJSONDecoder.decode(model.self, from: data)
            print(result)
        } catch let err {
            print(err.localizedDescription)
        }
        self.data = data
    }
}

struct TestModel: Codable {
    let name: String
    let age: Int
}
