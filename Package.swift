// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HDLibrary",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "HDLibrary",
            targets: ["HDSwiftLibrary", "HDOCLibrary"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
         .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.8.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(name: "HDOCLibrary",
                path: "Sources/HDOC",
//                参考 https://github.com/SwiftKickMobile/SwiftMessages
                resources: [
                    .process("Resources/Images"),
                    .copy("Resources/SH"),
                ]),
        .target(
            name: "HDSwiftLibrary",
            dependencies: ["Alamofire", "HDOCLibrary"],
            path: "Sources/HDSwift"),
        .testTarget(
            name: "HDLibraryTests",
            dependencies: ["HDSwiftLibrary", "HDOCLibrary"]),
    ]
)
