allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.buildDir = file("../build")

subprojects {
    project.buildDir = file("${rootProject.buildDir}/${project.name}")
    project.evaluationDependsOn(":app")
}

// PATCH isar_flutter_libs :
// 1. Namespace injecté (évite "Namespace not specified" avec AGP 8.x)
// 2. compileSdk forcé à 36 (évite le crash "android:attr/lStar not found")
subprojects {
    pluginManager.withPlugin("com.android.library") {
        extensions.findByType<com.android.build.gradle.LibraryExtension>()?.apply {
            compileSdk = 36                  // ← force tous les sous-modules à 36
            if (namespace == null) {
                namespace = project.group.toString()
            }
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.buildDir)
}