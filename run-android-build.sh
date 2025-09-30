#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
FRONTEND_DIR="$ROOT_DIR/notes_frontend"

echo ">> Ensuring dependencies are installed..."
cd "$FRONTEND_DIR"
if [ ! -d "node_modules" ]; then
  npm install
fi

echo ">> Generating native Android project (expo prebuild)..."
npm run prebuild:android

if [ ! -d "android" ]; then
  echo "ERROR: Android folder not found after prebuild. Please check Expo CLI output."
  exit 1
fi

echo ">> Running Gradle build..."
cd android
if [ ! -x "./gradlew" ]; then
  chmod +x ./gradlew || true
fi
./gradlew assembleDebug

echo ">> Build complete. APK artifacts located under android/app/build/outputs/apk/"
