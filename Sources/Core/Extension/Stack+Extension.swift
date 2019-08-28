//
//  Stack+Extension.swift
//  CoordinatorKit-iOS
//
//  Created by Bruno Fernandes on 9/15/18.
//  Copyright © 2018 bfernandesbfs. All rights reserved.
//

extension CoordinatorStack where Self: Coordinator {

    public func present(_ coordinator: Coordinator) {
        add(child: coordinator)
        coordinator.start()
    }

    public func show(_ coordinator: Coordinator, animated: Bool) {
        present(coordinator)
        router?.isModalPresent = true
        router?.present(coordinator, animated: animated)
    }

    public func push(_ coordinator: Coordinator, animated: Bool, completion: (()-> Void)?) {
        present(coordinator)
        router?.isModalPresent = false
        router?.push(coordinator, animated: animated, completion: completion)
    }

    public func finish(animated: Bool, completion: (()-> Void)?) {
        guard let parent = parent else {
            fatalError("This is an root coordinator and can't be removed")
        }
        remove(child: parent)
        dismissModule(animated: animated, completion: completion)
    }
}
