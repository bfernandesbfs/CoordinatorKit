//
//  File.swift
//  
//
//  Created by Bruno Fernandes on 14/12/19.
//

import UIKit
import CoordinatorKit

protocol AppEventProtocol {
    func handle(_ action: AppEvent)
}

enum AppEvent: Event {

    case next

    func sendToHandler(_ handler: AppEventProtocol) {
        handler.handle(self)
    }
}

final class AppCoordinator: Coordinator, AppEventProtocol {

    var rootViewController: UINavigationController

    var action: AppEvent?

    init() {
        rootViewController = UINavigationController()
    }

    func handle(_ action: AppEvent) {
        self.action = action
    }
}


protocol HomeEventProtocol {
    func handle(_ action: HomeEvent)
}

enum HomeEvent: Event {

    case next

    func sendToHandler(_ handler: HomeEventProtocol) {
        handler.handle(self)
    }
}

final class HomeCoordinator: Coordinator, HomeEventProtocol {

    var rootViewController: UIViewController

    var action: HomeEvent?

    init() {
        rootViewController = UIViewController()
    }

    func handle(_ action: HomeEvent) {
        self.action = action
    }
}
