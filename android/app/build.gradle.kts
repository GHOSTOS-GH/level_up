plugins {
    id("com.android.application")
    // "kotlin-android" retiré → Flutter gère Kotlin nativement (Built-in Kotlin)
    // Garder le plugin manuellement causera des erreurs dans les prochaines versions Flutter
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.level_up"
    compileSdk = 36                          // ← 35 → 36
    ndkVersion = "28.2.13676358"            // ← 27.0.12077973 → 28.2.13676358

    compileOptions {
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }

    defaultConfig {
        applicationId = "com.example.level_up"
        minSdk = flutter.minSdkVersion
        targetSdk = 36                       // ← aligné avec compileSdk
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        multiDexEnabled = true
    }

    buildTypes {
        release {
            isMinifyEnabled = false
            isShrinkResources = false
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}
