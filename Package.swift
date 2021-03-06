// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FusionMedia",
    products: [
        .library(
            name: "FusionMedia",
            targets: ["FusionMedia"]),
    ],
    dependencies: [
        .package(name: "Android", url: "git@github.com:FLORG1/swift-android.git", .branch("master"))
        //.package(name: "Android", path: "../swift-android")
    ],
    targets: [
        .target(
            name: "FusionMedia",
            dependencies: [
              .target(name: "FusionMedia_Common"),              
              .target(name: "FusionMedia_Apple", condition: .when(platforms: [.iOS, .macOS])),
              .target(name: "FusionMedia_Android", condition: .when(platforms: [.android])),
            ]            
        ),
        .target(
            name: "FusionMedia_Common"
        ),        
        .target(
            name: "FusionMedia_Apple",
            dependencies: [
              .target(name: "FusionMedia_Common"),
            ]                        
        ),            	
        .target(
            name: "FusionMedia_Android",
            dependencies: [
              .target(name: "FusionMedia_Common"),
              .product(name: "AndroidMedia", package: "Android", condition: .when(platforms: [.android]))
            ],
            resources: [.copy("Generated/Media.java")]
        )
    ]
)
