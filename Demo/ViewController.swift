//
//  ViewController.swift
//  Demo
//
//  Created by IPG on 2020/11/22.
//  Copyright © 2020 Taiki Kabaya. All rights reserved.
//

import UIKit
import KabaFire

struct Person: Codable {
    let name: String?
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getRequest()
    }
    
    func getRequest() {
        let url = "https://swapi.dev/api/people/1/"
        KabaFire.get(url: url, model: Person.self) { response in
            let person: Person = response
            print(person)
        }
    }
}
