public protocol Event {
    associatedtype Handler

    func sendToHandler(_ handler: Handler)
}
