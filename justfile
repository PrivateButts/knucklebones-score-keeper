dev:
  npx quasar dev

build-ide:
  npx quasar build -m capacitor -T android --ide

build-android-signed:
  npx quasar build -m capacitor -T android
  cd ./dist/capacitor/android/apk/release && ~/Android/Sdk/build-tools/35.0.0/zipalign -v 4 ./app-release-unsigned.apk ./knucklebones-scorekeeper.apk
  cd ./dist/capacitor/android/apk/release && ~/Android/Sdk/build-tools/35.0.0/apksigner sign --ks ../../../../../release.keystore ./knucklebones-scorekeeper.apk

sideload-build: build-android-signed
  cd ./dist/capacitor/android/apk/release && adb install -r ./knucklebones-scorekeeper.apk

act:
  act --secret-file development.secrets

regen-icons:
  npx @quasar/icongenie g -i ./source-icon.png
