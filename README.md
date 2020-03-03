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

#### Localization ✅
Use "".localized() any string you want to localize. Then you can follow helper scripts.

[Localize-Swift](https://github.com/marmelroy/Localize-Swift)
This will print the collected strings in the terminal. Select and copy to your default Localizable.strings.

[Laurine](https://github.com/JiriTrecak/Laurine)
Scans your Localizable.strings then generates Helper struct to use, ex: Localizations.MainTitle

------

#### Theming ✅

Preferred library: [SwiftTheme](https://github.com/wxxsw/SwiftTheme)

Use Common/Base UI components to avoid setting colors everywhere in app.
In project, review files under Common/Theme folder.

------

* Logger (May be used with analitycs services) ✅
* Styler (TextStyle, FontManager)
* Reusable (Identifiable)
* Loading Indicator integration ✅
* Extensions
* Bottom bar vc, PagerStripVC
* Constants
* Configuration File (May include all primary fonts, colors, urls.. ?) ✅
* Permissions (https://github.com/ivanvorobei/SPPermissions)
* SwiftLint ✅

* Plist manager
* BaseClasses, BaseComponents (BaseViews, Dark mode support)
* Component Factory (UI components)

------

## - Analytics
* Crahslytics
* Fabric

------
