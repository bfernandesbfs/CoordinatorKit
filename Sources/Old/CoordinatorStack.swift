//
//  CoordinatorStack.swift
//  CoordinatorKit-iOS
//
//  Created by Bruno Fernandes on 9/15/18.
//  Copyright © 2018 bfernandesbfs. All rights reserved.
//

public protocol CoordinatorStack: class {

    func present(_ coordinator: Coordinator)

    func show(_ coordinator: Coordinator, animated: Bool)

    func push(_ coordinator: Coordinator, animated: Bool, completion: (()-> Void)?)

    func finish(animated: Bool, completion: (()-> Void)?)
}
