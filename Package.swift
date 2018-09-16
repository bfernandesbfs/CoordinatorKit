// swift-tools-version:4.1
//
//  CoordinatorKit.swift
//  CoordinatorKit
//
//  Created by Bruno Fernandes on 23/10/15.
//  Copyright © 2017 bfernandesbfs. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "CoordinatorKit",
    products: [
        .library(
            name: "CoordinatorKit",
            targets: ["CoordinatorKit"]),
        ],
    dependencies: [],
    targets: [
        .target(
            name: "CoordinatorKit",
            dependencies: [],
            path: "Sources"),
        .testTarget(
            name: "CoordinatorKitTests",
            dependencies: ["CoordinatorKit"],
            path: "Tests")
    ]
)
