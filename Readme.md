# CoordinatorKit

[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![Travis](https://img.shields.io/travis/bfernandesbfs/CoordinatorKit/master.svg)](https://travis-ci.org/bfernandesbfs/CoordinatorKit/branches)

Coordinator chain responsability

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Requirements

- iOS 11.0+
- Xcode 10.0+

## Installation

### Dependency Managers

<details>
  <summary><strong>Swift Package Manager</strong></summary>

To use CoordinatorKit as a [Swift Package Manager](https://swift.org/package-manager/) package just add the following in your Package.swift file.

``` swift
// swift-tools-version:4.1

import PackageDescription

let package = Package(
    name: "HelloCoordinatorKit",
    dependencies: [
        .package(url: "https://github.com/bfernandesbfs/CoordinatorKit.git", .upToNextMajor(from: "1.0.0"))
    ],
    targets: [
        .target(name: "HelloCoordinatorKit", dependencies: ["CoordinatorKit"])
    ]
)
```
</details>

### Manually

- Copy files `Source/Core` directory to yours project.

## Usage

Add `import CoordinatorKit` and use `Coordinator` protocol to implement the objects needed into your class

```swift
import CoordinatorKit

final class AppCoordinator: Coordinator {

    var rootViewController: UINavigationController

    init() {
        rootViewController = UINavigationController()
    }
}
```

### Presenting an controller

`CoordinatorKit` have an resource to presenting:

* ViewTrasition
* NavigationViewTransition
* TabBarViewTransition

to use:

```swift

let controller = MyViewController()
router(ViewTransition.present(controller)) {
    print("End trasition")
}

```

## Contributing

Issues and pull requests are welcome!

See [Contributing](https://github.com/bfernandesbfs/CoordinatorKit/blob/master/Docs/CONTRIBUTING) for details.

## Author

Bruno Fernandes [@bfernandesbfs](https://twitter.com/bfernandesbfs)

## License

CoordinatorKit is released under the MIT license. See [LICENSE](https://github.com/bfernandesbfs/CoordinatorKit/blob/master/Docs/LICENSE) for details.
