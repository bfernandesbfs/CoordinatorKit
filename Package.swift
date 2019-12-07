// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoordinatorKit",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "CoordinatorKit",
            targets: ["CoordinatorKit"]),
    ],
    targets: [
        .target(
            name: "CoordinatorKit",
            path: "Sources",
            sources: ["Core"]),
        .testTarget(
            name: "CoordinatorKitTests",
            dependencies: ["CoordinatorKit"]),
    ]
)
