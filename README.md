## Suttunig simple Http library for IOS.

## Install

## Usage

```
import KabaFire

struct Person: Codable {
    let name: String?
}

let url = "https://swapi.dev/api/people/1/"
KabaFire.get(url: url, model: Person.self) { response in
    let person: Person = response
    print(person)
}
```

modelを指定しなければ、stringを返す。

The available instance method are listed below. 
KF.get(url: string, model: struct, )
