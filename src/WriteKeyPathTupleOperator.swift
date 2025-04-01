///
/// The purpose of this operator is to make the usage of scope functions more concise. Please feel free to change it to fit your needs or just don't use it if you don't like it.
///
/// Usage:
/// ```
///     let akos = second(Person()) {
///         \.name ~> "Akos"
///         \.age ~> 30
///     }
///```
///
infix operator ~>: AssignmentPrecedence

func ~><T, V>(keyPath: WritableKeyPath<T, V>, value: V) -> (WritableKeyPath<T, V>, V) {
    (keyPath, value)
}
