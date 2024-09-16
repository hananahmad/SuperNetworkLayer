// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NetworkingLayer",
    platforms: [
        .macOS(.v10_14), .iOS(.v13), .tvOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "NetworkingLayer",
            targets: ["NetworkingLayer"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
//         .package(url: "https://github.com/ashleymills/Reachability.swift", branch: "master"),
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", .upToNextMajor(from: "1.8.0")),
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.6.4")),
        .package(url: "https://github.com/smilesiosteam/SmilesLanguageManager.git", branch: "main"),
        .package(url: "https://github.com/smilesiosteam/SmilesBaseMainRequest.git", branch: "main"),
        .package(url: "https://github.com/smilesiosteam/SmilesUtilities.git", branch: "main"),
        .package(url: "https://github.com/smilesiosteam/SmilesStorage.git", branch: "main")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "NetworkingLayer",
            dependencies: [
                .product(name: "CryptoSwift", package: "CryptoSwift"),
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "SmilesLanguageManager", package: "SmilesLanguageManager"),
                .product(name: "SmilesBaseMainRequestManager", package: "SmilesBaseMainRequest"),
                .product(name: "SmilesUtilities", package: "SmilesUtilities"),
                .product(name: "SmilesStorage", package: "SmilesStorage")
            ]),
        .testTarget(
            name: "NetworkingLayerTests",
            dependencies: ["NetworkingLayer"]),
    ]
)
