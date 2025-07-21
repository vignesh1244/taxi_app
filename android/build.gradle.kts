buildscript {
    repositories {
        google()        // ✅ Needed for Gradle and Firebase plugins
        mavenCentral()
    }
    dependencies {
        classpath("com.android.tools.build:gradle:8.0.0")        // ✅ Correct Gradle plugin
        classpath("com.google.gms:google-services:4.3.10")       // ✅ Firebase plugin
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// ✅ Optional: Custom build directory setup
val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
    project.evaluationDependsOn(":app")
}

// ✅ Clean task
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
