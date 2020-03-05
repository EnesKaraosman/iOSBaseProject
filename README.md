# iOSBaseProject
You're gonna start to a new project and fed up doing same initialization every time.



# *TODO LIST*

## - Network

[Network.md](https://github.com/EnesKaraosman/iOSBaseProject/blob/master/BaseProject/Network/NetworkUsage.md) file exist in project's network module, for detail usage you can play with it.
#### Parsing

* SwiftyJSON ✅
* Codable ✅

#### Reactive
* Rx Extensions (versions) ✅
* Moya: Consider using enumeration cases for api (service interfaces) ref: ios-base-swift-master/Services ❌

#### Tracking network activities
*  External app: Bagel ✅
*  Internal pod: AlamofireNetworkActivityLogger ✅

#### Settings.bundle custom settings
* Add support for switching Environment from iOS > Settings > App > Environments ✅

------

## - Clean Architecture

#### Design Pattern
* MVVM ✅
* MVP
* VIPER

#### Coordinator
* XCoordinator ✅

#### Dependency Injection
* Resolver: https://github.com/hmlongco/Resolver

------

## - Database
* UserDefaults (propertyWrapper) ✅
* CoreData 
* Realm    

------

## - Helper, Util

#### ✅ Localization
Use "".localized() any string you want to localize. Then you can follow helper scripts.

[Localize-Swift](https://github.com/marmelroy/Localize-Swift)
This will print the collected strings in the terminal. Select and copy to your default Localizable.strings.

[Laurine](https://github.com/JiriTrecak/Laurine)
Scans your Localizable.strings then generates Helper struct to use, ex: Localizations.MainTitle

------

#### ✅ Theming

Preferred library: [SwiftTheme](https://github.com/wxxsw/SwiftTheme)

Use Common/Base UI components to avoid setting colors everywhere in app.
In project, review files under Common/Theme folder.

------

#### ✅ SwiftLint

[SwiftLint](https://github.com/realm/SwiftLint)

Add `"${PODS_ROOT}/SwiftLint/swiftlint"` script to Build Phases

Make sure .swiftlint.yml file must be on the root path of your project.

------

#### ✅ TextStyle, FontManager

* In case you want to add Custom Font
[Google Fonts](https://fonts.google.com/)

* How to add custom font to project? follow this tutorial.
[Add Custom Font](https://codewithchris.com/common-mistakes-with-adding-custom-fonts-to-your-ios-app/)

View `Common/TextStyle/TextStyle.swift` file in project.

Use `CommonLabel` to spread common functionality
You can simply init your font;
```swift
lbl.font = .init(.title1, .bold)
```

------

#### ✅ Logger

View `Log.swift` file, you can use anywhere you want in the project. <br/>
You might want to integrate Anayltics service(s) in error cases?

------

* ✅ Reusable (Identifiable)
* ✅ Loading Indicator integration `LoaderPresentable.swift`
* ✅ Configuration File (May include Fonts, Colors, EnvironmentURL..)
* Extensions
* Bottom bar vc, PagerStripVC
* Constants
* Permissions (https://github.com/ivanvorobei/SPPermissions)
* Plist manager
* Component Factory (UI components)

------

## - Analytics

In case you want to use multiple provider, consider abstraction via https://github.com/devxoul/Umbrella

* AmplitudeProvider (Amplitude-iOS)
* AnswersProvider (Answers)
* AppboyProvider (Appboy-iOS-SDK)
* AppsFlyerProvider (AppsFlyerFramework)
* FirebaseProvider (Firebase/Analytics)
* FlurryProvider (Flurry-iOS-SDK/FabricSDK)
* LocalyticsProvider (Localytics)
* MixpanelProvider (Mixpanel)

------
