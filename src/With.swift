///
/// Result builder to collect the keypaths and values in a type safe way.
/// Parameters:
/// - `T` The type of the object that will be updated. Inside the result builder it is used only for type inference.
///
@resultBuilder
fileprivate enum WithBuilder<T> {
    ///
    /// Implemented for better type inference. Namely, without this function we wouldn't be able to use keypaths without their root type in the `builder` closure of the `with` function.
    ///
    static func buildExpression<each V>(
        _ components: repeat (
            WritableKeyPath<T, each V>,
            each V
        )
    ) -> (repeat (WritableKeyPath<T, each V>, each V)) {
        (repeat each components)
    }

    ///
    /// Builder function to collect the keypaths and values.
    ///
    static func buildBlock<each V>(
        _ components: repeat (
            WritableKeyPath<T, each V>,
            each V
        )
    ) -> (repeat (WritableKeyPath<T, each V>, each V)) {
        (repeat each components)
    }
}

///
/// Example type used in the examples below.
/// ```
/// struct Person {
///     var name: String?
///     var age: Int?
/// }
/// ```
///
/// Usage 1# | Initalization, setting properties with tuple syntax, assigning the returning instance.
/// ```
/// let akos = with(Person()) {
///     (\.name, "Akos")
///     (\.age, 32)
/// }
/// ```
///
/// Usage 2# | Passing in an instance, setting properties with tuple syntax, assigning the returning instance.
/// ```
/// var akos = Person()
/// akos = with(akos) {
///    (\.name, "Akos")
///    (\.age, 32)
/// }
/// ```
///
/// Usage 3# | Setting properties with custom operator syntax. Feel free to define your own operator if you don't like this one.
/// ```
/// with(Person()) {
///    \.name ~> "Akos"
///    \.age ~> 32
/// }
/// ```
///
/// Usage N# | Not assigning the returning instance:
/// ``TODO: Add example``
///
@discardableResult
@inline(__always)
func with<T, each V>(
    _ item: T,
    @WithBuilder<T> _ builder: () -> (repeat (WritableKeyPath<T, each V>, each V))
) -> T {
    var itemCopy = item
    let updates = builder()
    for update in repeat each updates {
        let (keyPath, value) = update
        itemCopy[keyPath: keyPath] = value
    }
    return itemCopy
}
