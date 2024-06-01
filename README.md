
# AppInfo

A library containing standard App info (i.e. app name, verson & build numbers, p.list dictionary access, etc).


## Installation

Install AppInfo via Swift Package Manager to your Xcode project with the url below.

```
https://github.com/kevingreen22/AppInfo
```

## Usage/Examples

Import the package

```swift
import AppInfo
```

All methods and variables are static. So just calling the package name and the specific function you like will do the trick. 

Examples:

```swift
print(AppInfo.verson)
// prints the CFBundleShortVersionString number of the app.

print(AppInfo.developer)
// prints the developer of the app.

print(AppInfo.hasAppAlreadyLaunchedOnce())
// prints true or false depending if this is the first time launching the app on current device.

print(AppInfo.launchCount())
// prints the number of times the app has been launched on the current device.

```
