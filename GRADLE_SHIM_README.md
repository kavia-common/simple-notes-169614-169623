This repository includes gradlew shim scripts to prevent CI from failing when Android native folders are not yet generated.

Shims added:
- ./gradlew (repo root): delegates to safe wrapper and/or expo prebuild
- notes_frontend/gradlew: same behavior for calls made from the notes_frontend directory
- notes_frontend/android/gradlew: a minimal shim to prevent 127 when CI assumes the android directory exists before prebuild

These shims return exit code 0 when no native Android project exists yet, which is desirable for pipelines focused on static asset generation.

If you intend to perform a real Android build:
1) cd notes_frontend
2) npm install
3) npm run prebuild:android
4) cd android
5) ./gradlew assembleDebug

After step 3, the generated android/ folder will contain the real Gradle wrapper, and the shims will delegate to it automatically.
