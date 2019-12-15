import XCTest
@testable import CoordinatorKit

final class CoordinatorKitTests: XCTestCase {

    var sut: AppCoordinator!

    override func setUp() {
        super.setUp()
        sut = AppCoordinator()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func testInitializa() {
        XCTAssertNotNil(sut)
    }

//    func testRouterAddCoordinatorAsChildIntoRootCoordinator() {
//
//        let coordinator = HomeCoordinator()
//        sut.router(Transition.push(coordinator))
//
//        XCTAssertEqual(sut._stack.children.count, 1)
//        XCTAssertTrue(coordinator.nextResponder is AppCoordinator)
//    }

//    func testSendActionForResponsibilityChainForItSelf() {
//
//        let coordinator = HomeCoordinator()
//        sut.router(NavigationTransition.push(coordinator))
//
//        coordinator.tryToHandle(HomeEvent.next)
//
//        XCTAssertEqual(coordinator.action, HomeEvent.next)
//        XCTAssertNil(sut.action)
//
//    }

//    func testSendActionForChainCoordinator() {
//
//        let coordinator = HomeCoordinator()
//        sut.router(NavigationTransition.push(coordinator))
//
//        coordinator.tryToHandle(AppEvent.next)
//
//        XCTAssertEqual(sut.action, AppEvent.next)
//        XCTAssertNil(coordinator.action)
//
//    }

//    func testPresentCoordinator() {
//
//        let coordinatorA = HomeCoordinator()
//        let coordinatorB = AppCoordinator()
//
//        coordinatorA.router(ViewTransition.present(coordinatorB))
//
//        XCTAssertEqual(coordinatorA._stack.children.count, 1)
//        XCTAssertTrue(coordinatorB.nextResponder is HomeCoordinator)
//    }

    func testDismissCoordinator() {

        let coordinatorA = AppCoordinator()
        let coordinatorB = HomeCoordinator()

        let controller = UIViewController()

        coordinatorA.router(NavigationTransition.push(controller))

        coordinatorA.router(NavigationTransition.present(coordinatorB))

        coordinatorB.router(ViewTransition.dismiss())

        coordinatorA.router(NavigationTransition.pop())

    }
}
