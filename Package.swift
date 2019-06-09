// swift-tools-version:4.2
import PackageDescription

let pkg = Package(name: "Stylobate")
pkg.products = [
    .library(name: "Stylobate", targets: ["Stylobate"]),
]

let stylobate: Target = .target(name: "Stylobate")
stylobate.path = "Source"
stylobate.exclude = [
]
pkg.swiftLanguageVersions = [.v4, .v4_2]
pkg.targets = [
    stylobate,
    .testTarget(name: "StylobateTests", dependencies: ["Stylobate"])
]

