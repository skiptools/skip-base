# SkipFirebase

This package provides Firebase support for Skip app/framework projects.
The Swift side uses the official Firebase iOS SDK directly,
with the various `SkipFirebase*` modules passing the transpiled calls
through to the Firebase Android SDK.

**Note**: This is a preview package `SkipFirebaseFirestore` module

## Modules

The modules in the SkipFirebase framework project mirror the division of the SwiftPM
modules in the Firebase iOS SDK (at https://github.com/firebase/firebase-ios-sdk),
which is also mirrored in the division of the Firebase Kotlin Android SDK (at https://github.com/firebase/firebase-android-sdk).

An example of a Skip app projects using the `Firestore` and `Messaging` API can be seen
from the command:

```console
skip init --show-tree --icon-color='1abc9c' --no-zero --appid=skip.fireside.App --version 0.0.1 skipapp-fireside FireSide:skip-ui/SkipUI FireSideModel:skip-foundation/SkipFoundation:skip-model/SkipModel:skip-firebase/SkipFirebaseFirestore:skip-firebase/SkipFirebaseMessaging:skip-firebase/SkipFirebaseAuth
```

This will create an SwiftPM project in `skipapp-fireside/Package.swift` like:

```swift
// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "skipapp-fireside",
    defaultLocalization: "en",
    platforms: [.iOS(.v16), .macOS(.v13), .tvOS(.v16), .watchOS(.v9), .macCatalyst(.v16)],
    products: [
        .library(name: "FireSideApp", type: .dynamic, targets: ["FireSide"]),
        .library(name: "FireSideModel", targets: ["FireSideModel"]),
    ],
    dependencies: [
        .package(url: "https://source.skip.tools/skip.git", from: "0.7.42"),
        .package(url: "https://source.skip.tools/skip-ui.git", from: "0.0.0"),
        .package(url: "https://source.skip.tools/skip-foundation.git", from: "0.0.0"),
        .package(url: "https://source.skip.tools/skip-model.git", from: "0.0.0"),
        .package(url: "https://source.skip.tools/skip-firebase.git", from: "0.0.0")
    ],
    targets: [
        .target(name: "FireSide", dependencies: [
            "FireSideModel", 
            .product(name: "SkipFoundation", package: "skip-foundation"),
            .product(name: "SkipUI", package: "skip-ui")
        ], resources: [.process("Resources")], plugins: [.plugin(name: "skipstone", package: "skip")]),
        .testTarget(name: "FireSideTests", dependencies: [
            "FireSide", 
            .product(name: "SkipTest", package: "skip")
        ], resources: [.process("Resources")], plugins: [.plugin(name: "skipstone", package: "skip")]),
        
        .target(name: "FireSideModel", dependencies: [
            .product(name: "SkipFoundation", package: "skip-foundation"), 
            .product(name: "SkipModel", package: "skip-model"), 
            .product(name: "SkipFirebaseFirestore", package: "skip-firebase"), 
            .product(name: "SkipFirebaseMessaging", package: "skip-firebase"), 
            .product(name: "SkipFirebaseAuth", package: "skip-firebase")
        ], resources: [.process("Resources")], plugins: [.plugin(name: "skipstone", package: "skip")]),
        .testTarget(name: "FireSideModelTests", dependencies: [
            "FireSideModel", 
            .product(name: "SkipTest", package: "skip")
        ], resources: [.process("Resources")], plugins: [.plugin(name: "skipstone", package: "skip")]),
    ]
)

```

The individual modules are as follows:


### SkipFirebaseFirestore

Provides Skip parity to the [FirebaseFirestore](https://firebase.google.com/docs/reference/swift/firebasefirestore/api/reference/Classes/Firestore) API for the Swift and Kotlin sides of the Firebase API.


Example usage:

```swift
#if !SKIP
import FirebaseFirestore
#else
import SkipFirebaseFirestore
#endif

let firestore = Firestore.firestore()
let result = try await firestore.update()
```


## Preview Modules

The following modules will compile, but no API parity is provided yet.
Please consider opening an issue or pull request if an implementation of any
of these modules is needed.


### SkipFirebaseAnalytics

Provides Skip parity to the [FirebaseAnalytics](https://firebase.google.com/docs/reference/swift/firebaseanalytics/api/reference/Classes/Analytics) API for the Swift and Kotlin sides of the Firebase API.


Example usage:

```swift
#if !SKIP
import FirebaseAnalytics
#else
import SkipFirebaseAnalytics
#endif

let analytics = Analytics.analytics()
let result = try await analytics.update()
```

### SkipFirebaseAppCheck

Provides Skip parity to the [FirebaseAppCheck](https://firebase.google.com/docs/reference/swift/firebaseappcheck/api/reference/Classes/AppCheck) API for the Swift and Kotlin sides of the Firebase API.


Example usage:

```swift
#if !SKIP
import FirebaseAppCheck
#else
import SkipFirebaseAppCheck
#endif

let appcheck = AppCheck.appCheck()
let result = try await appcheck.update()
```

### SkipFirebaseAuth

Provides Skip parity to the [FirebaseAuth](https://firebase.google.com/docs/reference/swift/firebaseauth/api/reference/Classes/Auth) API for the Swift and Kotlin sides of the Firebase API.


Example usage:

```swift
#if !SKIP
import FirebaseAuth
#else
import SkipFirebaseAuth
#endif

let auth = Auth.auth()
let result = try await auth.update()
```

### SkipFirebaseCrashlytics

Provides Skip parity to the [FirebaseCrashlytics](https://firebase.google.com/docs/reference/swift/firebasecrashlytics/api/reference/Classes/Crashlytics) API for the Swift and Kotlin sides of the Firebase API.


Example usage:

```swift
#if !SKIP
import FirebaseCrashlytics
#else
import SkipFirebaseCrashlytics
#endif

let crashlytics = Crashlytics.crashlytics()
let result = try await crashlytics.update()
```

### SkipFirebaseDatabase

Provides Skip parity to the [FirebaseDatabase](https://firebase.google.com/docs/reference/swift/firebasedatabase/api/reference/Classes/Database) API for the Swift and Kotlin sides of the Firebase API.


Example usage:

```swift
#if !SKIP
import FirebaseDatabase
#else
import SkipFirebaseDatabase
#endif

let database = Database.database()
let result = try await database.update()
```

### SkipFirebaseFunctions

Provides Skip parity to the [FirebaseFunctions](https://firebase.google.com/docs/reference/swift/firebasefunctions/api/reference/Classes/Functions) API for the Swift and Kotlin sides of the Firebase API.


Example usage:

```swift
#if !SKIP
import FirebaseFunctions
#else
import SkipFirebaseFunctions
#endif

let functions = Functions.functions()
let result = try await functions.update()
```

### SkipFirebaseInstallations

Provides Skip parity to the [FirebaseInstallations](https://firebase.google.com/docs/reference/swift/firebaseinstallations/api/reference/Classes/Installations) API for the Swift and Kotlin sides of the Firebase API.


Example usage:

```swift
#if !SKIP
import FirebaseInstallations
#else
import SkipFirebaseInstallations
#endif

let installations = Installations.installations()
let result = try await installations.update()
```

### SkipFirebaseMessaging

Provides Skip parity to the [FirebaseMessaging](https://firebase.google.com/docs/reference/swift/firebasemessaging/api/reference/Classes/Messaging) API for the Swift and Kotlin sides of the Firebase API.


Example usage:

```swift
#if !SKIP
import FirebaseMessaging
#else
import SkipFirebaseMessaging
#endif

let messaging = Messaging.messaging()
let result = try await messaging.update()
```

### SkipFirebaseRemoteConfig

Provides Skip parity to the [FirebaseRemoteConfig](https://firebase.google.com/docs/reference/swift/firebaseremoteconfig/api/reference/Classes/RemoteConfig) API for the Swift and Kotlin sides of the Firebase API.


Example usage:

```swift
#if !SKIP
import FirebaseRemoteConfig
#else
import SkipFirebaseRemoteConfig
#endif

let remoteconfig = RemoteConfig.remoteConfig()
let result = try await remoteconfig.update()
```

### SkipFirebaseStorage

Provides Skip parity to the [FirebaseStorage](https://firebase.google.com/docs/reference/swift/firebasestorage/api/reference/Classes/Storage) API for the Swift and Kotlin sides of the Firebase API.


Example usage:

```swift
#if !SKIP
import FirebaseStorage
#else
import SkipFirebaseStorage
#endif

let storage = Storage.storage()
let result = try await storage.update()
```



## Building

This project is a free Swift Package Manager module that uses the
[Skip](https://skip.tools) plugin to transpile Swift into Kotlin.

Building the module requires that Skip be installed using 
[Homebrew](https://brew.sh) with `brew install skiptools/skip/skip`.
This will also install the necessary build prerequisites:
Kotlin, Gradle, and the Android build tools.


## Testing

The module can be tested using the standard `swift test` command
or by running the test target for the macOS destination in Xcode,
which will run the Swift tests as well as the transpiled
Kotlin JUnit tests in the Robolectric Android simulation environment.

Parity testing can be performed with `skip test`,
which will output a table of the test results for both platforms.
