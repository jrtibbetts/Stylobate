// swift-tools-version:5.0
import PackageDescription

let pkg = Package(
    name: "Stylobate",

    platforms: [
        .iOS(.v12)
    ],

    products: [
        .library(
            name: "Stylobate",
            targets: ["Stylobate"]
        )
    ],

    dependencies: [ ],

    targets: [
        .target(
            name: "Stylobate",
            path: "Source"
        )
    ]
)
