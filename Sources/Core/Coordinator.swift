//
//  Coordinator.swift
//  CoordinatorKit-iOS
//
//  Created by Bruno Fernandes on 9/15/18.
//  Copyright © 2018 bfernandesbfs. All rights reserved.
//

public protocol Coordinator: CoordinatorStack, CoordinatorRouter, Responder {

    func start()
}
