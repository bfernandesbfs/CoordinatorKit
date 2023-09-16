import UIKit

public protocol SharedRootProtocol {}

public protocol SharedCoordinator: Coordinator, SharedRootProtocol {

    associatedtype InitialViewController: UIViewController

    var initialViewController: InitialViewController { get }

}

extension SharedCoordinator {

    public var viewController: UIViewController! {
        return initialViewController
    }
}
