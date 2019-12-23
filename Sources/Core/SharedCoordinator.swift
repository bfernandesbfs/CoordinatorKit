import UIKit

public protocol SharedCoordinator {

    var initialViewController: UIViewController { get }
}

extension SharedCoordinator where Self: Coordinator {

    public var viewController: UIViewController! {
        return initialViewController
    }
}
