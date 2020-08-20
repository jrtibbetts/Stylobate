// swift-tools-version:5.3
import PackageDescription

let pkg = Package(
    name: "Stylobate",

    platforms: [
        .iOS(.v13)
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
            path: "Source",
            exclude: ["Info.plist"],
            resources: [.copy("Resources")]
        ),
        .testTarget(
            name: "StylobateTests",
            dependencies: ["Stylobate"],
            path: "Tests",
            exclude: ["Info.plist"],
            resources: [.copy("JSON/SampleFoo.json"), .process("*/*.xib"), .process("*/*.storyboard")]
        )
    ]
)
