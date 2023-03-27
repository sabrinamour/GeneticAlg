// swift-tools-version: 5.6

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "GeneticAlgorthm",
    platforms: [
        .iOS("15.2")
    ],
    products: [
        .iOSApplication(
            name: "GeneticAlgorthm",
            targets: ["AppModule"],
            bundleIdentifier: "non.testtttt",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .note),
            accentColor: .presetColor(.indigo),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ]
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: "."
        )
    ]
)