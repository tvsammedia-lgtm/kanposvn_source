allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
// isar_flutter_libs 3.1.0+1 khai bao compileSdk 30 va thieu namespace,
// se loi voi AGP moi (namespace) va android:attr/lStar (androidx.core moi).
// namespace: gan ngay khi plugin applied; compileSdk: gan sau when module
// script da ghi compileSdkVersion 30.
subprojects {
    if (name == "isar_flutter_libs") {
        plugins.withId("com.android.library") {
            extensions.configure<com.android.build.gradle.LibraryExtension>("android") {
                namespace = "dev.isar.isar_flutter_libs"
            }
        }
        afterEvaluate {
            extensions.configure<com.android.build.gradle.LibraryExtension>("android") {
                compileSdk = 36
            }
        }
    }
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
