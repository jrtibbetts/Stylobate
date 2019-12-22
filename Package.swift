// swift-tools-version:5.1
import PackageDescription

let pkg = Package(
  name: "Stylobate",

  swiftLanguageVersions = [.v4, .v4_2],

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
      dependencies: ["UIKit"],
      path: "Source",
      exclude = [ ]
    ),
    .testTarget(
      name: "StylobateTests",
      dependencies: ["Stylobate"],
      path: "Tests",
      exclude = [ ]
    )
  ]
)

