// swift-tools-version:5.3
import PackageDescription

let pkg = Package(
    name: "Stylobate",

    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .tvOS(.v14)
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
            resources: [
                .process("Strings.strings")
            ]
        ),
        .testTarget(
            name: "StylobateTests",
            dependencies: ["Stylobate"],
            path: "Tests",
            exclude: ["Info.plist"],
            resources: [
                .copy("JSON/SampleFoo.json"),
                .process("Controllers/CollectionAndTableTests.storyboard"),
                .process("Core Data/StylobateTestModel.xcdatamodeld"),
                .process("Views/CollectionAndTableDisplayTests.xib"),
                .process("Views/FormattedLabelTests.storyboard"),
                .process("Views/MissingCellTests.xib"),
                .process("Views/VideoPreview.xib")
            ]
        )
    ]

)
