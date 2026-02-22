allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// إعداد مجلد البناء (Build Directory)
val newBuildDir: Directory = rootProject.layout.buildDirectory
    .dir("../../build")
    .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val proj = this
    val newSubprojectBuildDir: Directory = newBuildDir.dir(proj.name)
    proj.layout.buildDirectory.value(newSubprojectBuildDir)
}

// حل مشكلة الـ Namespace للمكتبات القديمة
subprojects {
    val proj = this
    proj.plugins.withType<com.android.build.gradle.BasePlugin> {
        val androidExtension = proj.extensions.findByName("android") as? com.android.build.gradle.BaseExtension
        if (androidExtension != null && androidExtension.namespace == null) {
            when (proj.name) {
                "isar_flutter_libs" -> androidExtension.namespace = "dev.isar.isar_flutter_libs"
                "app_settings" -> androidExtension.namespace = "com.spencerccf.app_settings"
                "flutter_localization" -> androidExtension.namespace = "com.mastertipsy.flutter_localization"
            }
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}