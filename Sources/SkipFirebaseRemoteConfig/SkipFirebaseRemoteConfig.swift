// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org

import SkipFirebaseCore
#if SKIP
import kotlinx.coroutines.tasks.await

public final class RemoteConfig {
    public let remoteconfig: com.google.firebase.remoteconfig.FirebaseRemoteConfig

    public init(remoteconfig: com.google.firebase.remoteconfig.FirebaseRemoteConfig) {
        self.remoteconfig = remoteconfig
    }

    public static func remoteConfig() -> RemoteConfig {
        RemoteConfig(remoteconfig: com.google.firebase.remoteconfig.FirebaseRemoteConfig.getInstance())
    }

    public static func remoteConfig(app: FirebaseApp) -> RemoteConfig {
        RemoteConfig(remoteconfig: com.google.firebase.remoteconfig.FirebaseRemoteConfig.getInstance(app.app))
    }
}
#endif

//import FirebaseRemoteConfig
//private func demoRemoteConfig() {
//    let _ = RemoteConfig.remoteConfig().configSettings.minimumFetchInterval
//}
