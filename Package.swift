// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SamplePackageB-iOS",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SamplePackageB-iOS",
            targets: ["SamplePackageB-iOS"]
        ),
        .library(
            name: "ThirdPartyResources",
            targets: ["ThirdPartyResources"]
        ),
        .library(
            name: "ThirdPartyAdapter",
            targets: ["ThirdPartyAdapter"]
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SamplePackageB-iOS",
            dependencies: [
                .target(name: "OneSignal", condition: .when(platforms: [.iOS])),
                .target(name: "OneSignalCore", condition: .when(platforms: [.iOS])),
                .target(name: "OneSignalExtension", condition: .when(platforms: [.iOS])),
                .target(name: "OneSignalOutcomes", condition: .when(platforms: [.iOS])),
                .target(name: "dumb", condition: .when(platforms: [.iOS])),
                .target(name: "opus", condition: .when(platforms: [.iOS])),
                .target(name: "tta++", condition: .when(platforms: [.iOS])),
                .target(name: "ogg", condition: .when(platforms: [.iOS]))
            ]
        ),
        .target(
            name: "ThirdPartyAdapter",
            dependencies: [
                "SamplePackageB-iOS",
                "ThirdPartyResources"
            ]
        ),
        .target(
            name: "ThirdPartyResources",
            dependencies: [
                .target(
                    name: "OneSignal",
                    condition: .when(platforms: [.iOS])
                ),
                .target(
                    name: "OneSignalCore",
                    condition: .when(platforms: [.iOS])
                ),
                .target(
                    name: "OneSignalExtension",
                    condition: .when(platforms: [.iOS])
                ),
                .target(
                    name: "OneSignalOutcomes",
                    condition: .when(platforms: [.iOS])
                ),
                .target(
                    name: "dumb",
                    condition: .when(platforms: [.iOS])
                ),
                .target(
                    name: "opus",
                    condition: .when(platforms: [.iOS])
                ),
                .target(
                    name: "tta++",
                    condition: .when(platforms: [.iOS])
                ),
                .target(
                    name: "ogg",
                    condition: .when(platforms: [.iOS])
                )
            ],
            resources: [.copy("Resources/3pa.sdk.bundle")]
        ),
        .testTarget(
            name: "SamplePackageBTests",
            dependencies: ["SamplePackageB-iOS"]
        ),
        .binaryTarget(
            name: "OneSignal",
            path: "Frameworks/ThirdPartyVendor/iOS/OneSignal.xcframework"
        ),
        .binaryTarget(
            name: "OneSignalCore",
            path: "Frameworks/ThirdPartyVendor/iOS/OneSignalCore.xcframework"
        ),
        .binaryTarget(
            name: "OneSignalExtension",
            path: "Frameworks/ThirdPartyVendor/iOS/OneSignalExtension.xcframework"
        ),
        .binaryTarget(
            name: "OneSignalOutcomes",
            path: "Frameworks/ThirdPartyVendor/iOS/OneSignalOutcomes.xcframework"
        ),
        .binaryTarget(
            name: "dumb",
            path: "Frameworks/ThirdPartyVendor/iOS/dumb.xcframework"
        ),
        .binaryTarget(
            name: "opus",
            path: "Frameworks/ThirdPartyVendor/iOS/opus.xcframework"
        ),
        .binaryTarget(
            name: "tta++",
            path: "Frameworks/ThirdPartyVendor/iOS/tta++.xcframework"
        ),
        .binaryTarget(
            name: "ogg",
            path: "Frameworks/ThirdPartyVendor/iOS/ogg.xcframework"
        )
    ]
)
