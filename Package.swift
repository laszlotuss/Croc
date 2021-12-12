// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Croc",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "Croc",
            targets: ["Croc"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Croc",
            path: "Source",
            resources: [.process("../py/emojis.json")]
            ),
        .testTarget(
            name: "CrocTests",
            dependencies: ["Croc"],
            path: "Tests",
            exclude: ["StringExtensionTests.swift", "CharExtensionTests.swift", "Info.plist"]
            ),
        .testTarget(
            name: "CharExtensionTests",
            dependencies: ["Croc"],
            path: "Tests",
            exclude: ["StringExtensionTests.swift", "EmojiLookupTests.swift", "Info.plist"]
            ),
        .testTarget(
            name: "StringExtensionTests",
            dependencies: ["Croc"],
            path: "Tests",
            exclude: ["CharExtensionTests.swift", "EmojiLookupTests.swift", "Info.plist"]
            )
    ],
    swiftLanguageVersions: [.v4_2]
)
