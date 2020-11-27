## Suttunig simple Http library for IOS.

## Usage


```
import UIKit
import KabaFire

struct Person: Codable {
    let name: String?
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "https://swapi.dev/api/people/1/"
        KabaFire.get(url: url, model: Person.self, completion: { response in
            let person: Person = response
            print(person)
        })

    }
}
```
