Static assets for Screen 1

Files:
- design-system.css
- screen-1-screen-1-2.html
- screen-1-screen-1-2.css
- app.js

How to open the static screen:
- In a browser, open: notes_frontend/assets/screen-1-screen-1-2.html
  Make sure it can access the images under /assets/figmaimages from the project root if served via a static server.

About the Gradle error you saw:
- The project is a React Native/Expo app. The native Android project and Gradle wrapper (./gradlew) are not present until you generate them.
- To generate them and resolve the "./gradlew: No such file or directory" error:
  1) From notes_frontend directory, run:
     npm install
     npm run prebuild:android
  2) Then build:
     cd android
     ./gradlew assembleDebug

Note: These steps are unrelated to the static HTML/CSS/JS assets, which are already complete and do not require a native build.
