# SwiftScopeFunctions
[WIP] A KeyPath, parameter pack and result builder based collection of scope functions in Swift. Inspired by Kotlin.

## Reference
Kotlin docs: https://kotlinlang.org/docs/scope-functions.html
TODO: add all the references where the problem is discussed, explain context receivers and other concepts.

## With
Currently only the `with` function is implemented. Kotlin reference: https://kotlinlang.org/docs/scope-functions.html#with

### Usage
Unlike other options available in Swift in public repositories, the `with` function of this repo is 
1. Implemented using `WritableKeyPaths`, `parameter packs` and a `result builder` which makes this implementation full type safe and easy to use. 
2. Can be used with any type that has KeyPath support. TODO: provide examples for this. struct, class, actor, enum, tuple etc.
3. Is Swift 6 compatible.

There are two different ways to use the `with` function of this repo. With a custom operator `~>` (users are encouraged to change the custom operator to their taste), or with regular tuple syntax.

#### Custom operator syntax:

```swift
struct Person {
    var name: String?
    var age: Int?
}

let akos = with(Person()) {
    \.name ~> "Akos"
    \.age ~> 32
}
```

#### Tuple syntax:
 
```swift
struct Person {
    var name: String?
    var age: Int?
}

let akos = with(Person()) {
    (\.name, "Akos")
    (\.age, 32)
}
```


## Future
In the future it is planned to add all the other scope functions of Kotlin, although their characteristics are quite different from `with`.

## Alternatives
List of other alternatives in Swift's open source community:
TODO: add the list of alternatives
