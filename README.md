# 💊 의약품 검색 및 조회 앱 Pilly
> 공공데이터포털에서 제공하는 약품 정보를 활용하여
일반 사용자들도 쉽게 의약품 검색 및 상세 정보를 조회할 수 있는 모바일 앱

<br>

## 프로젝트 소개
> Pilly는 공공의료 데이터에 기반하여 신뢰할 수 있는 의약품 정보를 사용자 친화적인 UI로 제공하는 앱입니다. 사용자는 약의 이름을 통해 의약품을 검색하고, 복용법 및 주의사항을 쉽게 확인할 수 있습니다.

<br>

## 팀원 구성
<div align="center">

| **iOS / 신승욱** |
| :------: |
| [<img src="https://avatars.githubusercontent.com/u/69791286?v=4" height=100 width=100> <br/> @shinseunguk](https://github.com/shinseunguk) |
</div>

<br>

## 1. 개발 환경

- Front-end : Flutter
- Back-end : N/A
- 버전 및 이슈관리 : N/A
- 협업 툴 : N/A
- 디자인 : N/A
- [커밋 컨벤션](https://inpa.tistory.com/entry/GIT-⚡%EF%B8%8F-Gitmoji-사용법-Gitmoji-cli#)
<br>

## 2. 채택한 개발 기술

### Flutter
- **크로스 플랫폼 개발**
    - 하나의 코드베이스로 iOS와 Android를 동시에 지원할 수 있어 개발 리소스를 절약할 수 있습니다.
    - 플랫폼 별 UI 차이를 최소화하고 일관된 사용자 경험을 제공합니다.있습니다.
- **UI 구성의 유연성**
    - 위젯 단위로 구성된 구조 덕분에 자유롭고 창의적인 UI 구현이 가능합니다.
    - 커스터마이징이 쉬우며 다양한 디자인 요구사항을 빠르게 반영할 수 있습니다.
- **빠른 개발 속도**
    - Hot Reload 기능으로 UI 수정 사항을 즉시 확인할 수 있어 개발 및 디버깅 속도가 매우 빠릅니다.
    - 초기에 빠른 프로토타이핑과 반복적인 피드백 반영이 가능합니다.

### GetX
- **간결한 상태 관리**
    - `Obx`, `Rx`, `Controller` 중심으로 간결한 코드로 상태를 관리할 수 있어 가독성이 뛰어납니다.
    - `setState()`나 `StreamBuilder` 없이도 반응형 UI 구현이 가능합니다.
- **통합 기능 제공**
    - 상태 관리뿐만 아니라 라우팅, 의존성 주입, 로컬 스토리지 관리 등 다양한 기능을 하나의 패키지로 제공합니다.
    - 외부 라이브러리를 최소화하면서도 다양한 기능을 갖출 수 있습니다.
- **MVVM 패턴과의 높은 호환성**
    - ViewModel을 GetX의 Controller로 구성하여 아키텍처적인 정합성이 뛰어나고 유지보수도 용이합니다.

### MVVM (Model-View-ViewModel)

- **역할 분리**
  - UI(View)와 비즈니스 로직(ViewModel)을 명확히 분리하여 코드의 책임을 분명히 했습니다.
  - 유지보수 및 기능 확장 시 영향 범위를 최소화할 수 있습니다.
- **상태 중심 개발**
  - ViewModel을 통해 UI 상태를 중앙 집중적으로 관리하고, View는 상태 변화만을 반영하도록 설계되어 테스트와 디버깅이 용이합니다.
- **테스트 용이성**
  - View와 로직이 분리되어 있어 ViewModel 단위 테스트 작성이 수월하며, 안정적인 코드 품질 유지가 가능합니다.
<br>

## 3. 프로젝트 구조

```
.
├── README.md
├── analysis_options.yaml
├── android
│   ├── app
│   │   ├── build.gradle.kts
│   │   └── src
│   │       ├── debug
│   │       │   └── AndroidManifest.xml
│   │       ├── main
│   │       │   ├── AndroidManifest.xml
│   │       │   ├── java
│   │       │   │   └── io
│   │       │   │       └── flutter
│   │       │   │           └── plugins
│   │       │   │               └── GeneratedPluginRegistrant.java
│   │       │   ├── kotlin
│   │       │   │   └── com
│   │       │   │       └── example
│   │       │   │           └── pilly
│   │       │   │               └── MainActivity.kt
│   │       │   └── res
│   │       │       ├── drawable
│   │       │       │   └── launch_background.xml
│   │       │       ├── drawable-v21
│   │       │       │   └── launch_background.xml
│   │       │       ├── mipmap-hdpi
│   │       │       │   └── ic_launcher.png
│   │       │       ├── mipmap-mdpi
│   │       │       │   └── ic_launcher.png
│   │       │       ├── mipmap-xhdpi
│   │       │       │   └── ic_launcher.png
│   │       │       ├── mipmap-xxhdpi
│   │       │       │   └── ic_launcher.png
│   │       │       ├── mipmap-xxxhdpi
│   │       │       │   └── ic_launcher.png
│   │       │       ├── values
│   │       │       │   └── styles.xml
│   │       │       └── values-night
│   │       │           └── styles.xml
│   │       └── profile
│   │           └── AndroidManifest.xml
│   ├── build.gradle.kts
│   ├── gradle
│   │   └── wrapper
│   │       ├── gradle-wrapper.jar
│   │       └── gradle-wrapper.properties
│   ├── gradle.properties
│   ├── gradlew
│   ├── gradlew.bat
│   ├── local.properties
│   ├── pilly_android.iml
│   └── settings.gradle.kts
├── assets
│   └── images
│       └── image_coming_soon.png
├── build
│   ├── 69ee95a58ae92cc02372740c92e83f1a
│   │   ├── _composite.stamp
│   │   ├── gen_dart_plugin_registrant.stamp
│   │   └── gen_localizations.stamp
│   ├── cache.dill.track.dill
│   ├── dd0c0196fb6095fb512d479c7b70dabe
│   │   ├── _composite.stamp
│   │   ├── gen_dart_plugin_registrant.stamp
│   │   └── gen_localizations.stamp
│   ├── flutter_assets
│   │   ├── AssetManifest.bin
│   │   ├── AssetManifest.bin.json
│   │   ├── AssetManifest.json
│   │   ├── FontManifest.json
│   │   ├── NOTICES
│   │   ├── assets
│   │   │   └── images
│   │   │       └── image_coming_soon.png
│   │   ├── fonts
│   │   │   └── MaterialIcons-Regular.otf
│   │   ├── packages
│   │   │   └── cupertino_icons
│   │   │       └── assets
│   │   │           └── CupertinoIcons.ttf
│   │   └── shaders
│   │       └── ink_sparkle.frag
│   ├── ios
│   │   ├── Debug-iphonesimulator
│   │   │   ├── App.framework
│   │   │   │   ├── App
│   │   │   │   ├── Info.plist
│   │   │   │   ├── _CodeSignature
│   │   │   │   │   └── CodeResources
│   │   │   │   └── flutter_assets
│   │   │   │       ├── AssetManifest.bin
│   │   │   │       ├── AssetManifest.json
│   │   │   │       ├── FontManifest.json
│   │   │   │       ├── NOTICES.Z
│   │   │   │       ├── NativeAssetsManifest.json
│   │   │   │       ├── assets
│   │   │   │       │   └── images
│   │   │   │       │       └── image_coming_soon.png
│   │   │   │       ├── fonts
│   │   │   │       │   └── MaterialIcons-Regular.otf
│   │   │   │       ├── isolate_snapshot_data
│   │   │   │       ├── kernel_blob.bin
│   │   │   │       ├── packages
│   │   │   │       │   └── cupertino_icons
│   │   │   │       │       └── assets
│   │   │   │       │           └── CupertinoIcons.ttf
│   │   │   │       ├── shaders
│   │   │   │       │   └── ink_sparkle.frag
│   │   │   │       └── vm_snapshot_data
│   │   │   ├── Flutter
│   │   │   ├── Flutter.framework
│   │   │   │   ├── Flutter
│   │   │   │   ├── Headers
│   │   │   │   │   ├── Flutter.h
│   │   │   │   │   ├── FlutterAppDelegate.h
│   │   │   │   │   ├── FlutterBinaryMessenger.h
│   │   │   │   │   ├── FlutterCallbackCache.h
│   │   │   │   │   ├── FlutterChannels.h
│   │   │   │   │   ├── FlutterCodecs.h
│   │   │   │   │   ├── FlutterDartProject.h
│   │   │   │   │   ├── FlutterEngine.h
│   │   │   │   │   ├── FlutterEngineGroup.h
│   │   │   │   │   ├── FlutterHeadlessDartRunner.h
│   │   │   │   │   ├── FlutterHourFormat.h
│   │   │   │   │   ├── FlutterMacros.h
│   │   │   │   │   ├── FlutterPlatformViews.h
│   │   │   │   │   ├── FlutterPlugin.h
│   │   │   │   │   ├── FlutterPluginAppLifeCycleDelegate.h
│   │   │   │   │   ├── FlutterTexture.h
│   │   │   │   │   └── FlutterViewController.h
│   │   │   │   ├── Info.plist
│   │   │   │   ├── Modules
│   │   │   │   │   └── module.modulemap
│   │   │   │   ├── PrivacyInfo.xcprivacy
│   │   │   │   ├── _CodeSignature
│   │   │   │   │   └── CodeResources
│   │   │   │   └── icudtl.dat
│   │   │   ├── Pods_Runner.framework
│   │   │   │   ├── Headers
│   │   │   │   │   └── Pods-Runner-umbrella.h
│   │   │   │   ├── Info.plist
│   │   │   │   ├── Modules
│   │   │   │   │   └── module.modulemap
│   │   │   │   ├── Pods_Runner
│   │   │   │   └── _CodeSignature
│   │   │   │       ├── CodeDirectory
│   │   │   │       ├── CodeRequirements
│   │   │   │       ├── CodeRequirements-1
│   │   │   │       ├── CodeResources
│   │   │   │       └── CodeSignature
│   │   │   ├── Runner.app
│   │   │   │   ├── AppFrameworkInfo.plist
│   │   │   │   ├── AppIcon60x60@2x.png
│   │   │   │   ├── AppIcon76x76@2x~ipad.png
│   │   │   │   ├── Assets.car
│   │   │   │   ├── Base.lproj
│   │   │   │   │   ├── LaunchScreen.storyboardc
│   │   │   │   │   │   ├── 01J-lp-oVM-view-Ze5-6b-2t3.nib
│   │   │   │   │   │   ├── Info.plist
│   │   │   │   │   │   └── UIViewController-01J-lp-oVM.nib
│   │   │   │   │   └── Main.storyboardc
│   │   │   │   │       ├── BYZ-38-t0r-view-8bC-Xf-vdC.nib
│   │   │   │   │       ├── Info.plist
│   │   │   │   │       └── UIViewController-BYZ-38-t0r.nib
│   │   │   │   ├── Frameworks
│   │   │   │   │   ├── App.framework
│   │   │   │   │   │   ├── App
│   │   │   │   │   │   ├── Info.plist
│   │   │   │   │   │   ├── _CodeSignature
│   │   │   │   │   │   │   └── CodeResources
│   │   │   │   │   │   └── flutter_assets
│   │   │   │   │   │       ├── AssetManifest.bin
│   │   │   │   │   │       ├── AssetManifest.json
│   │   │   │   │   │       ├── FontManifest.json
│   │   │   │   │   │       ├── NOTICES.Z
│   │   │   │   │   │       ├── NativeAssetsManifest.json
│   │   │   │   │   │       ├── assets
│   │   │   │   │   │       │   └── images
│   │   │   │   │   │       │       └── image_coming_soon.png
│   │   │   │   │   │       ├── fonts
│   │   │   │   │   │       │   └── MaterialIcons-Regular.otf
│   │   │   │   │   │       ├── isolate_snapshot_data
│   │   │   │   │   │       ├── kernel_blob.bin
│   │   │   │   │   │       ├── packages
│   │   │   │   │   │       │   └── cupertino_icons
│   │   │   │   │   │       │       └── assets
│   │   │   │   │   │       │           └── CupertinoIcons.ttf
│   │   │   │   │   │       ├── shaders
│   │   │   │   │   │       │   └── ink_sparkle.frag
│   │   │   │   │   │       └── vm_snapshot_data
│   │   │   │   │   ├── Flutter.framework
│   │   │   │   │   │   ├── Flutter
│   │   │   │   │   │   ├── Headers
│   │   │   │   │   │   │   ├── Flutter.h
│   │   │   │   │   │   │   ├── FlutterAppDelegate.h
│   │   │   │   │   │   │   ├── FlutterBinaryMessenger.h
│   │   │   │   │   │   │   ├── FlutterCallbackCache.h
│   │   │   │   │   │   │   ├── FlutterChannels.h
│   │   │   │   │   │   │   ├── FlutterCodecs.h
│   │   │   │   │   │   │   ├── FlutterDartProject.h
│   │   │   │   │   │   │   ├── FlutterEngine.h
│   │   │   │   │   │   │   ├── FlutterEngineGroup.h
│   │   │   │   │   │   │   ├── FlutterHeadlessDartRunner.h
│   │   │   │   │   │   │   ├── FlutterHourFormat.h
│   │   │   │   │   │   │   ├── FlutterMacros.h
│   │   │   │   │   │   │   ├── FlutterPlatformViews.h
│   │   │   │   │   │   │   ├── FlutterPlugin.h
│   │   │   │   │   │   │   ├── FlutterPluginAppLifeCycleDelegate.h
│   │   │   │   │   │   │   ├── FlutterTexture.h
│   │   │   │   │   │   │   └── FlutterViewController.h
│   │   │   │   │   │   ├── Info.plist
│   │   │   │   │   │   ├── Modules
│   │   │   │   │   │   │   └── module.modulemap
│   │   │   │   │   │   ├── PrivacyInfo.xcprivacy
│   │   │   │   │   │   ├── _CodeSignature
│   │   │   │   │   │   │   └── CodeResources
│   │   │   │   │   │   └── icudtl.dat
│   │   │   │   │   ├── flutter_native_splash.framework
│   │   │   │   │   │   ├── Info.plist
│   │   │   │   │   │   ├── _CodeSignature
│   │   │   │   │   │   │   └── CodeResources
│   │   │   │   │   │   ├── flutter_native_splash
│   │   │   │   │   │   └── flutter_native_splash_privacy.bundle
│   │   │   │   │   │       ├── Info.plist
│   │   │   │   │   │       └── PrivacyInfo.xcprivacy
│   │   │   │   │   └── shared_preferences_foundation.framework
│   │   │   │   │       ├── Info.plist
│   │   │   │   │       ├── _CodeSignature
│   │   │   │   │       │   └── CodeResources
│   │   │   │   │       ├── shared_preferences_foundation
│   │   │   │   │       └── shared_preferences_foundation_privacy.bundle
│   │   │   │   │           ├── Info.plist
│   │   │   │   │           └── PrivacyInfo.xcprivacy
│   │   │   │   ├── Info.plist
│   │   │   │   ├── PkgInfo
│   │   │   │   ├── Runner
│   │   │   │   ├── Runner.debug.dylib
│   │   │   │   ├── _CodeSignature
│   │   │   │   │   └── CodeResources
│   │   │   │   └── __preview.dylib
│   │   │   ├── Runner.swiftmodule
│   │   │   │   ├── Project
│   │   │   │   │   └── arm64-apple-ios-simulator.swiftsourceinfo
│   │   │   │   ├── arm64-apple-ios-simulator.abi.json
│   │   │   │   ├── arm64-apple-ios-simulator.swiftdoc
│   │   │   │   └── arm64-apple-ios-simulator.swiftmodule
│   │   │   ├── flutter_native_splash
│   │   │   │   ├── flutter_native_splash.framework
│   │   │   │   │   ├── Headers
│   │   │   │   │   │   ├── FlutterNativeSplashPlugin.h
│   │   │   │   │   │   └── flutter_native_splash-umbrella.h
│   │   │   │   │   ├── Info.plist
│   │   │   │   │   ├── Modules
│   │   │   │   │   │   └── module.modulemap
│   │   │   │   │   ├── _CodeSignature
│   │   │   │   │   │   └── CodeResources
│   │   │   │   │   ├── flutter_native_splash
│   │   │   │   │   └── flutter_native_splash_privacy.bundle
│   │   │   │   │       ├── Info.plist
│   │   │   │   │       └── PrivacyInfo.xcprivacy
│   │   │   │   └── flutter_native_splash_privacy.bundle
│   │   │   │       ├── Info.plist
│   │   │   │       └── PrivacyInfo.xcprivacy
│   │   │   └── shared_preferences_foundation
│   │   │       ├── shared_preferences_foundation.framework
│   │   │       │   ├── Headers
│   │   │       │   │   ├── shared_preferences_foundation-Swift.h
│   │   │       │   │   └── shared_preferences_foundation-umbrella.h
│   │   │       │   ├── Info.plist
│   │   │       │   ├── Modules
│   │   │       │   │   ├── module.modulemap
│   │   │       │   │   └── shared_preferences_foundation.swiftmodule
│   │   │       │   │       ├── Project
│   │   │       │   │       │   ├── arm64-apple-ios-simulator.swiftsourceinfo
│   │   │       │   │       │   └── x86_64-apple-ios-simulator.swiftsourceinfo
│   │   │       │   │       ├── arm64-apple-ios-simulator.abi.json
│   │   │       │   │       ├── arm64-apple-ios-simulator.swiftdoc
│   │   │       │   │       ├── arm64-apple-ios-simulator.swiftmodule
│   │   │       │   │       ├── x86_64-apple-ios-simulator.abi.json
│   │   │       │   │       ├── x86_64-apple-ios-simulator.swiftdoc
│   │   │       │   │       └── x86_64-apple-ios-simulator.swiftmodule
│   │   │       │   ├── _CodeSignature
│   │   │       │   │   └── CodeResources
│   │   │       │   ├── shared_preferences_foundation
│   │   │       │   └── shared_preferences_foundation_privacy.bundle
│   │   │       │       ├── Info.plist
│   │   │       │       └── PrivacyInfo.xcprivacy
│   │   │       └── shared_preferences_foundation_privacy.bundle
│   │   │           ├── Info.plist
│   │   │           └── PrivacyInfo.xcprivacy
│   │   ├── XCBuildData
│   │   │   └── PIFCache
│   │   │       ├── project
│   │   │       │   ├── PROJECT@v11_mod=276c4abab39c5caabb536594fc097215_hash=bfdfe7dc352907fc980b868725387e98plugins=1OJSG6M1FOV3XYQCBH7Z29RZ0FPR9XDE1-json
│   │   │       │   └── PROJECT@v11_mod=7a5c131e8bac81ebc28bf5452bfe729f_hash=bfdfe7dc352907fc980b868725387e98plugins=1OJSG6M1FOV3XYQCBH7Z29RZ0FPR9XDE1-json
│   │   │       ├── target
│   │   │       │   ├── TARGET@v11_hash=07b6c5979ee864deab9cb71d7a1d014f-json
│   │   │       │   ├── TARGET@v11_hash=171b8dc3bc61b58200df7e5436a8b305-json
│   │   │       │   ├── TARGET@v11_hash=18beac3a1dfc013c3652a9a8ac65d13e-json
│   │   │       │   ├── TARGET@v11_hash=33256f98375d4af6375ac2e298343645-json
│   │   │       │   ├── TARGET@v11_hash=6f1491a0c055a3f9182a2d1b5f1d0f32-json
│   │   │       │   ├── TARGET@v11_hash=6fe37f01e09141ead7b6f207fdd25de9-json
│   │   │       │   ├── TARGET@v11_hash=75929db9a42bce87cb0f35ad842ea915-json
│   │   │       │   ├── TARGET@v11_hash=7a8b1ff6530f476aada4ca442a0597ec-json
│   │   │       │   ├── TARGET@v11_hash=9b62a1f2decc1076610f5c5ec4e5bcbb-json
│   │   │       │   ├── TARGET@v11_hash=ca861c1cb56f260f6bcf246d81cf3cd8-json
│   │   │       │   ├── TARGET@v11_hash=d3b7055a28384000f09d2268035b8159-json
│   │   │       │   └── TARGET@v11_hash=e8113bd6d510d083149a2fcc10dafdb9-json
│   │   │       └── workspace
│   │   │           ├── WORKSPACE@v11_hash=(null)_subobjects=841104bd9baf03b894e44de609bd9ae8-json
│   │   │           └── WORKSPACE@v11_hash=(null)_subobjects=f7c0fbe1e3920a9d8256313aadedf28a-json
│   │   ├── iphonesimulator
│   │   │   └── Runner.app
│   │   │       ├── AppFrameworkInfo.plist
│   │   │       ├── AppIcon60x60@2x.png
│   │   │       ├── AppIcon76x76@2x~ipad.png
│   │   │       ├── Assets.car
│   │   │       ├── Base.lproj
│   │   │       │   ├── LaunchScreen.storyboardc
│   │   │       │   │   ├── 01J-lp-oVM-view-Ze5-6b-2t3.nib
│   │   │       │   │   ├── Info.plist
│   │   │       │   │   └── UIViewController-01J-lp-oVM.nib
│   │   │       │   └── Main.storyboardc
│   │   │       │       ├── BYZ-38-t0r-view-8bC-Xf-vdC.nib
│   │   │       │       ├── Info.plist
│   │   │       │       └── UIViewController-BYZ-38-t0r.nib
│   │   │       ├── Frameworks
│   │   │       │   ├── App.framework
│   │   │       │   │   ├── App
│   │   │       │   │   ├── Info.plist
│   │   │       │   │   ├── _CodeSignature
│   │   │       │   │   │   └── CodeResources
│   │   │       │   │   └── flutter_assets
│   │   │       │   │       ├── AssetManifest.bin
│   │   │       │   │       ├── AssetManifest.json
│   │   │       │   │       ├── FontManifest.json
│   │   │       │   │       ├── NOTICES.Z
│   │   │       │   │       ├── NativeAssetsManifest.json
│   │   │       │   │       ├── assets
│   │   │       │   │       │   └── images
│   │   │       │   │       │       └── image_coming_soon.png
│   │   │       │   │       ├── fonts
│   │   │       │   │       │   └── MaterialIcons-Regular.otf
│   │   │       │   │       ├── isolate_snapshot_data
│   │   │       │   │       ├── kernel_blob.bin
│   │   │       │   │       ├── packages
│   │   │       │   │       │   └── cupertino_icons
│   │   │       │   │       │       └── assets
│   │   │       │   │       │           └── CupertinoIcons.ttf
│   │   │       │   │       ├── shaders
│   │   │       │   │       │   └── ink_sparkle.frag
│   │   │       │   │       └── vm_snapshot_data
│   │   │       │   ├── Flutter.framework
│   │   │       │   │   ├── Flutter
│   │   │       │   │   ├── Headers
│   │   │       │   │   │   ├── Flutter.h
│   │   │       │   │   │   ├── FlutterAppDelegate.h
│   │   │       │   │   │   ├── FlutterBinaryMessenger.h
│   │   │       │   │   │   ├── FlutterCallbackCache.h
│   │   │       │   │   │   ├── FlutterChannels.h
│   │   │       │   │   │   ├── FlutterCodecs.h
│   │   │       │   │   │   ├── FlutterDartProject.h
│   │   │       │   │   │   ├── FlutterEngine.h
│   │   │       │   │   │   ├── FlutterEngineGroup.h
│   │   │       │   │   │   ├── FlutterHeadlessDartRunner.h
│   │   │       │   │   │   ├── FlutterHourFormat.h
│   │   │       │   │   │   ├── FlutterMacros.h
│   │   │       │   │   │   ├── FlutterPlatformViews.h
│   │   │       │   │   │   ├── FlutterPlugin.h
│   │   │       │   │   │   ├── FlutterPluginAppLifeCycleDelegate.h
│   │   │       │   │   │   ├── FlutterTexture.h
│   │   │       │   │   │   └── FlutterViewController.h
│   │   │       │   │   ├── Info.plist
│   │   │       │   │   ├── Modules
│   │   │       │   │   │   └── module.modulemap
│   │   │       │   │   ├── PrivacyInfo.xcprivacy
│   │   │       │   │   ├── _CodeSignature
│   │   │       │   │   │   └── CodeResources
│   │   │       │   │   └── icudtl.dat
│   │   │       │   ├── flutter_native_splash.framework
│   │   │       │   │   ├── Info.plist
│   │   │       │   │   ├── _CodeSignature
│   │   │       │   │   │   └── CodeResources
│   │   │       │   │   ├── flutter_native_splash
│   │   │       │   │   └── flutter_native_splash_privacy.bundle
│   │   │       │   │       ├── Info.plist
│   │   │       │   │       └── PrivacyInfo.xcprivacy
│   │   │       │   └── shared_preferences_foundation.framework
│   │   │       │       ├── Info.plist
│   │   │       │       ├── _CodeSignature
│   │   │       │       │   └── CodeResources
│   │   │       │       ├── shared_preferences_foundation
│   │   │       │       └── shared_preferences_foundation_privacy.bundle
│   │   │       │           ├── Info.plist
│   │   │       │           └── PrivacyInfo.xcprivacy
│   │   │       ├── Info.plist
│   │   │       ├── PkgInfo
│   │   │       ├── Runner
│   │   │       ├── Runner.debug.dylib
│   │   │       ├── _CodeSignature
│   │   │       │   └── CodeResources
│   │   │       └── __preview.dylib
│   │   └── pod_inputs.fingerprint
│   └── native_assets
│       └── ios
├── ios
│   ├── Flutter
│   │   ├── AppFrameworkInfo.plist
│   │   ├── Debug.xcconfig
│   │   ├── Flutter.podspec
│   │   ├── Generated.xcconfig
│   │   ├── Release.xcconfig
│   │   └── flutter_export_environment.sh
│   ├── Podfile
│   ├── Podfile.lock
│   ├── Pods
│   │   ├── Headers
│   │   ├── Local Podspecs
│   │   │   ├── Flutter.podspec.json
│   │   │   ├── flutter_native_splash.podspec.json
│   │   │   └── shared_preferences_foundation.podspec.json
│   │   ├── Manifest.lock
│   │   ├── Pods.xcodeproj
│   │   │   ├── project.pbxproj
│   │   │   └── xcuserdata
│   │   │       └── incross0915.xcuserdatad
│   │   │           └── xcschemes
│   │   │               ├── Flutter.xcscheme
│   │   │               ├── Pods-Runner.xcscheme
│   │   │               ├── Pods-RunnerTests.xcscheme
│   │   │               ├── flutter_native_splash-flutter_native_splash_privacy.xcscheme
│   │   │               ├── flutter_native_splash.xcscheme
│   │   │               ├── shared_preferences_foundation-shared_preferences_foundation_privacy.xcscheme
│   │   │               ├── shared_preferences_foundation.xcscheme
│   │   │               └── xcschememanagement.plist
│   │   └── Target Support Files
│   │       ├── Flutter
│   │       │   ├── Flutter.debug.xcconfig
│   │       │   └── Flutter.release.xcconfig
│   │       ├── Pods-Runner
│   │       │   ├── Pods-Runner-Info.plist
│   │       │   ├── Pods-Runner-acknowledgements.markdown
│   │       │   ├── Pods-Runner-acknowledgements.plist
│   │       │   ├── Pods-Runner-dummy.m
│   │       │   ├── Pods-Runner-frameworks-Debug-input-files.xcfilelist
│   │       │   ├── Pods-Runner-frameworks-Debug-output-files.xcfilelist
│   │       │   ├── Pods-Runner-frameworks-Profile-input-files.xcfilelist
│   │       │   ├── Pods-Runner-frameworks-Profile-output-files.xcfilelist
│   │       │   ├── Pods-Runner-frameworks-Release-input-files.xcfilelist
│   │       │   ├── Pods-Runner-frameworks-Release-output-files.xcfilelist
│   │       │   ├── Pods-Runner-frameworks.sh
│   │       │   ├── Pods-Runner-umbrella.h
│   │       │   ├── Pods-Runner.debug.xcconfig
│   │       │   ├── Pods-Runner.modulemap
│   │       │   ├── Pods-Runner.profile.xcconfig
│   │       │   └── Pods-Runner.release.xcconfig
│   │       ├── Pods-RunnerTests
│   │       │   ├── Pods-RunnerTests-Info.plist
│   │       │   ├── Pods-RunnerTests-acknowledgements.markdown
│   │       │   ├── Pods-RunnerTests-acknowledgements.plist
│   │       │   ├── Pods-RunnerTests-dummy.m
│   │       │   ├── Pods-RunnerTests-umbrella.h
│   │       │   ├── Pods-RunnerTests.debug.xcconfig
│   │       │   ├── Pods-RunnerTests.modulemap
│   │       │   ├── Pods-RunnerTests.profile.xcconfig
│   │       │   └── Pods-RunnerTests.release.xcconfig
│   │       ├── flutter_native_splash
│   │       │   ├── ResourceBundle-flutter_native_splash_privacy-flutter_native_splash-Info.plist
│   │       │   ├── flutter_native_splash-Info.plist
│   │       │   ├── flutter_native_splash-dummy.m
│   │       │   ├── flutter_native_splash-prefix.pch
│   │       │   ├── flutter_native_splash-umbrella.h
│   │       │   ├── flutter_native_splash.debug.xcconfig
│   │       │   ├── flutter_native_splash.modulemap
│   │       │   └── flutter_native_splash.release.xcconfig
│   │       └── shared_preferences_foundation
│   │           ├── ResourceBundle-shared_preferences_foundation_privacy-shared_preferences_foundation-Info.plist
│   │           ├── shared_preferences_foundation-Info.plist
│   │           ├── shared_preferences_foundation-dummy.m
│   │           ├── shared_preferences_foundation-prefix.pch
│   │           ├── shared_preferences_foundation-umbrella.h
│   │           ├── shared_preferences_foundation.debug.xcconfig
│   │           ├── shared_preferences_foundation.modulemap
│   │           └── shared_preferences_foundation.release.xcconfig
│   ├── Runner
│   │   ├── AppDelegate.swift
│   │   ├── Assets.xcassets
│   │   │   ├── AppIcon.appiconset
│   │   │   │   ├── Contents.json
│   │   │   │   ├── Icon-App-1024x1024@1x.png
│   │   │   │   ├── Icon-App-20x20@1x.png
│   │   │   │   ├── Icon-App-20x20@2x.png
│   │   │   │   ├── Icon-App-20x20@3x.png
│   │   │   │   ├── Icon-App-29x29@1x.png
│   │   │   │   ├── Icon-App-29x29@2x.png
│   │   │   │   ├── Icon-App-29x29@3x.png
│   │   │   │   ├── Icon-App-40x40@1x.png
│   │   │   │   ├── Icon-App-40x40@2x.png
│   │   │   │   ├── Icon-App-40x40@3x.png
│   │   │   │   ├── Icon-App-60x60@2x.png
│   │   │   │   ├── Icon-App-60x60@3x.png
│   │   │   │   ├── Icon-App-76x76@1x.png
│   │   │   │   ├── Icon-App-76x76@2x.png
│   │   │   │   └── Icon-App-83.5x83.5@2x.png
│   │   │   └── LaunchImage.imageset
│   │   │       ├── Contents.json
│   │   │       ├── README.md
│   │   │       ├── pilly.png
│   │   │       ├── pilly2x.png
│   │   │       └── pilly3x.png
│   │   ├── Base.lproj
│   │   │   ├── LaunchScreen.storyboard
│   │   │   └── Main.storyboard
│   │   ├── GeneratedPluginRegistrant.h
│   │   ├── GeneratedPluginRegistrant.m
│   │   ├── Info.plist
│   │   └── Runner-Bridging-Header.h
│   ├── Runner.xcodeproj
│   │   ├── project.pbxproj
│   │   ├── project.xcworkspace
│   │   │   ├── contents.xcworkspacedata
│   │   │   └── xcshareddata
│   │   │       ├── IDEWorkspaceChecks.plist
│   │   │       ├── WorkspaceSettings.xcsettings
│   │   │       └── swiftpm
│   │   │           └── configuration
│   │   └── xcshareddata
│   │       └── xcschemes
│   │           └── Runner.xcscheme
│   ├── Runner.xcworkspace
│   │   ├── contents.xcworkspacedata
│   │   ├── xcshareddata
│   │   │   ├── IDEWorkspaceChecks.plist
│   │   │   ├── WorkspaceSettings.xcsettings
│   │   │   └── swiftpm
│   │   │       └── configuration
│   │   └── xcuserdata
│   │       └── incross0915.xcuserdatad
│   │           └── UserInterfaceState.xcuserstate
│   └── RunnerTests
│       └── RunnerTests.swift
├── lib
│   ├── dataSource
│   │   └── medicine_data_soruce.dart
│   ├── main.dart
│   ├── model
│   │   └── medicine.dart
│   ├── repository
│   │   └── medicine_repository.dart
│   ├── view
│   │   ├── detail
│   │   │   └── medicine_detail_view.dart
│   │   ├── list
│   │   │   ├── medicine_list_view.dart
│   │   │   └── medicine_search_bar.dart
│   │   └── navigation_bar_view.dart
│   └── viewModel
│       ├── detail
│       └── list
│           └── medicine_list_view_model.dart
├── linux
│   ├── CMakeLists.txt
│   ├── flutter
│   │   ├── CMakeLists.txt
│   │   ├── ephemeral
│   │   ├── generated_plugin_registrant.cc
│   │   ├── generated_plugin_registrant.h
│   │   └── generated_plugins.cmake
│   └── runner
│       ├── CMakeLists.txt
│       ├── main.cc
│       ├── my_application.cc
│       └── my_application.h
├── macos
│   ├── Flutter
│   │   ├── Flutter-Debug.xcconfig
│   │   ├── Flutter-Release.xcconfig
│   │   ├── GeneratedPluginRegistrant.swift
│   │   └── ephemeral
│   │       ├── Flutter-Generated.xcconfig
│   │       └── flutter_export_environment.sh
│   ├── Podfile
│   ├── Runner
│   │   ├── AppDelegate.swift
│   │   ├── Assets.xcassets
│   │   │   └── AppIcon.appiconset
│   │   │       ├── Contents.json
│   │   │       ├── app_icon_1024.png
│   │   │       ├── app_icon_128.png
│   │   │       ├── app_icon_16.png
│   │   │       ├── app_icon_256.png
│   │   │       ├── app_icon_32.png
│   │   │       ├── app_icon_512.png
│   │   │       └── app_icon_64.png
│   │   ├── Base.lproj
│   │   │   └── MainMenu.xib
│   │   ├── Configs
│   │   │   ├── AppInfo.xcconfig
│   │   │   ├── Debug.xcconfig
│   │   │   ├── Release.xcconfig
│   │   │   └── Warnings.xcconfig
│   │   ├── DebugProfile.entitlements
│   │   ├── Info.plist
│   │   ├── MainFlutterWindow.swift
│   │   └── Release.entitlements
│   ├── Runner.xcodeproj
│   │   ├── project.pbxproj
│   │   ├── project.xcworkspace
│   │   │   └── xcshareddata
│   │   │       └── IDEWorkspaceChecks.plist
│   │   └── xcshareddata
│   │       └── xcschemes
│   │           └── Runner.xcscheme
│   ├── Runner.xcworkspace
│   │   ├── contents.xcworkspacedata
│   │   └── xcshareddata
│   │       └── IDEWorkspaceChecks.plist
│   └── RunnerTests
│       └── RunnerTests.swift
├── pilly.iml
├── pubspec.lock
├── pubspec.yaml
├── test
│   └── widget_test.dart
├── web
│   ├── favicon.png
│   ├── icons
│   │   ├── Icon-192.png
│   │   ├── Icon-512.png
│   │   ├── Icon-maskable-192.png
│   │   └── Icon-maskable-512.png
│   ├── index.html
│   └── manifest.json
└── windows
    ├── CMakeLists.txt
    ├── flutter
    │   ├── CMakeLists.txt
    │   ├── ephemeral
    │   ├── generated_plugin_registrant.cc
    │   ├── generated_plugin_registrant.h
    │   └── generated_plugins.cmake
    └── runner
        ├── CMakeLists.txt
        ├── Runner.rc
        ├── flutter_window.cpp
        ├── flutter_window.h
        ├── main.cpp
        ├── resource.h
        ├── resources
        │   └── app_icon.ico
        ├── runner.exe.manifest
        ├── utils.cpp
        ├── utils.h
        ├── win32_window.cpp
        └── win32_window.h
```

<br>

## 4. 역할 분담

### 🍊 신승욱

- **UI**
  - 페이지: 검색 화면, 의약품 상세, 즐겨찾기(내 알약 통), 스플래시
  - 공통 컴포넌트: 검색바, 리스트 카드 UI, 로딩 인디케이터, 디테일 항목 뷰, 탭 네비게이션
  - 기타: 디바운스 적용, 이미지 없을 경우 대체 이미지 처리, 반응형 레이아웃 구성

- **기능**
  - 공공데이터포털 의약품 API 연동
  - 의약품 검색 (디바운스 적용)
  - 무한 스크롤 기반 페이지네이션
  - 의약품 즐겨찾기(추가/삭제)
  - 즐겨찾기 유지 및 내 알약 통에서 목록 관리
  - 상세 페이지에서 이미지/효능/복용법 등 정보 제공
  - GetX 기반 상태 관리 및 MVVM 구조 적용

<br>
    
## 5. 개발 기간 및 작업 관리

### 개발 기간

- 전체 개발 기간 : 2025-04-25 ~ 2025-04-30
- UI 구현 : 2025-04-25 ~ 2025-04-30
- 기능 구현 : 2025-04-25 ~ 2025-04-30

<br>


## 6. 신경 쓴 부분

- N/A

<br>

## 7. 페이지별 기능

### [초기 화면]
- 서비스 접속 초기화면으로 splash 화면이 잠시 나온 뒤 메인화면으로 이동합니다.
- Splash 화면에서 이루어지는 것들.
    - 2초 후에 메인화면으로 이동
    - 환경변수 load(공공데이터포털 API ServerKey)

| 초기 화면 |
|----------|
|![Splash 정상](https://github.com/user-attachments/assets/5d387513-f157-4e3e-bfbd-e204b55f882c)|


<br>

### [의약품 리스트]
- 무한 스크롤 기반 페이지네이션
- 의약품 검색 (계속되는 서버요청을 막기 위한 `디바운스 적용`)
- 의약품 즐겨찾기(추가/삭제)
- 상세 페이지로 이동

| 무한 스크롤 기반 페이지네이션 | 의약품 검색 | 
|----------| ----------|
|![의약품 리스트, 페이지네이션 정상](https://github.com/user-attachments/assets/c94054f0-3d8e-4778-82ad-242512707bc0)|![의약품 리스트, 검색](https://github.com/user-attachments/assets/549e3089-e01a-4ff0-8280-55038537241f)|


| 의약품 즐겨찾기(추가/삭제) | 상세 페이지로 이동 | 
|----------| ----------|
|![의약품 리스트, 즐겨찾기](https://github.com/user-attachments/assets/ba6a5167-1d9a-4ce2-a268-1ad20113344d)|![의약품 리스트, 상세페이지](https://github.com/user-attachments/assets/6475d5a4-c734-4b83-9e15-33b9523103ee)|

<br>

### [내 알약 통]
- 의약품 즐겨찾기(추가/삭제)
- 상세 페이지로 이동

| 내 알약 통 |
|----------|
|![내 알약 통](https://github.com/user-attachments/assets/420e3d22-633e-4952-9829-b6507e6ea7f2)|

### [의약품 상세 페이지]
- 의약품에 대한 상세 내용들을 조회 가능
- 의약품 즐겨찾기(추가/삭제)

| 상세 페이지 |
|----------|
|![상세페이지](https://github.com/user-attachments/assets/6c7ce396-d855-44da-9d66-8cde515b6500)|

<br>

## 8. 트러블 슈팅

> Issue: Splash 화면에서 메인화면으로 넘어올때 LoadingIndicator가 아닌 `No Data available` 이 노출됨

> TO-BE: 불필요한 서버 호출이 진행되어 isLoading을 false로 변경하는 부분을 제거

| 변경 전 | 변경 후 | 
|----------| ----------|
|![Splash 비정상](https://github.com/user-attachments/assets/b57e4511-764d-4cfb-b037-44edd8352cb1)|![Splash 정상](https://github.com/user-attachments/assets/97d3672d-8c0e-47c7-8d8b-b619ffeb5e5d)|


> Issue: 무한 스크롤 페이지네이션 로직에서 PageNo를 1씩 증가시키며 서버에 데이터를 요청, 그런데 PageNo++ 연산이 비동기적으로 처리되다 보니, 동일한 PageNo로 중복 요청이 발생하면서 같은 데이터가 배열에 중복 추가되는 문제가 발생하고 있었음.

> TO-BE: 해당 로직을 동기처리로 변경하여 배열에 중복 추가를 막음.

<img width="1067" alt="image" src="https://github.com/user-attachments/assets/98b4a476-f3ef-498b-a516-c729e0af728e" />

| 변경 전 | 변경 후 | 
|----------| ----------|
|![Simulator Screenshot - iPhone 16 Pro Max - 2025-05-08 at 10 56 32](https://github.com/user-attachments/assets/46317200-1193-4dae-afc5-cdc3790118de)|![Simulator Screenshot - iPhone 16 Pro Max - 2025-05-08 at 10 55 56](https://github.com/user-attachments/assets/02fba2ab-6079-46b0-b6d3-c4edc6f01298)|





<br>

## 9. 개선 목표

- 디자이너와 함께 작업한 것이 아니라 디자인이 미흡한 부분이 있는데 개선이 됐으면 함.
- 의약품 검색 기능은 백앤드를 거치지 않은 단순 검색어를 추가한 Get 호출이기 때문에 정확도는 조금 떨어 질 것으로 판단됨, 추후 서버 작업을 통해 엘라스틱 서치를 도입하여 검색 정확도를 높히는 것이 목표

```
AS-IS
의약품 : 활명수
검색어 : 홞
결과 : N/A

TO-BE
의약품 : 활명수
검색어 : 홞
결과 : 활명수
```

    
<br>

## 10. 프로젝트 후기

### 😶‍🌫️ 신승욱

Flutter를 활용하여 실생활에 도움이 될 수 있는 크로스 플랫폼 앱을 만들어 보고 싶었고, 그 과정에서 공공데이터포털이 제공하는 의약품 데이터를 접하게 되었습니다.
의약품은 일상생활에서 누구나 한 번쯤은 접하게 되는 정보인 만큼, 보다 쉽고 정확하게 접근할 수 있는 방법이 있다면 큰 도움이 될 것이라는 생각이 들었습니다.

비록 공공데이터가 국내에 유통 중인 모든 의약품을 포함하고 있는지는 확실치 않지만, 제공되는 범위 내에서는 상당히 신뢰도 높은 정보와 구조화된 데이터가 제공되어 활용 가능성이 높다고 판단했습니다.

Flutter를 통해 iOS와 Android 양 플랫폼에서 동일한 사용자 경험을 제공하면서도, 실제 사용자에게 가치 있는 서비스를 구현해보는 경험을 할 수 있었던 뜻깊은 프로젝트였습니다.
향후에는 검색 정확도 개선, 약품 이미지 인식 기능 추가 등으로 더 발전시켜보고 싶은 욕심도 생겼습니다.

<br>
