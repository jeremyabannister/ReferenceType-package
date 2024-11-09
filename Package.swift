// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "ReferenceType-package",
    products: [
        .library(
            name: "ReferenceType-module",
            targets: [
                "ReferenceType-module",
            ]
        ),
        .library(
            name: "ReferenceTypeTestToolkit",
            targets: [
                "ReferenceTypeTestToolkit",
            ]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/jeremyabannister/ValueType-package",
            .upToNextMinor(from: "0.1.5")
        ),
    ],
    targets: [
        .target(
            name: "ReferenceType-module",
            dependencies: [
                .product(
                    name: "ValueType-module",
                    package: "ValueType-package"
                ),
            ]
        ),
        .target(
            name: "ReferenceTypeTestToolkit",
            dependencies: [
                "ReferenceType-module",
                .product(
                    name: "ValueTypeTestToolkit",
                    package: "ValueType-package"
                ),
            ]
        ),
        .testTarget(
            name: "ReferenceType-tests",
            dependencies: [
                "ReferenceTypeTestToolkit",
            ]
        ),
        .testTarget(
            name: "ReferenceTypeTestToolkit-tests",
            dependencies: [
                "ReferenceTypeTestToolkit",
            ]
        ),
    ]
)
