KabaFire
=========

Very simple HTTP client for ios

## Install
### Carthage
github "t-kabaya/KabaFire"

## Example Usage

```swift
import KabaFire

struct Person: Codable {
    let name: String
    let gender: String?
}

let url = "https://swapi.dev/api/people/1/"
KabaFire.get(url: url, model: Person.self) { response in
    let person: Person = response
    print(person)
}
// Person(
//    name: "Luke Skywalker",
//    gender: "male"
// )
```


```swift
let header: [String : Any] = [
    "Content-Type": "text/html",
]

let body: [String: Any] = [
    "age": 20
]

KabaFire.post(url: url, model: Person.self, header: header, body: body) { person in
    print(person) // Person(...)
}
```

Also support delete and put.

```swift
KabaFire.delete(...)
KabaFire.put(...)
```
