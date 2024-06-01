//
//  AppInfo.swift
//  Special Order Keeper iPhone
//
//  Created by LukeSideWalker (StackOverflow) on 2/23/20.
//  Added to by kevingreen22
//  https://stackoverflow.com/questions/24501288/getting-version-and-build-information-with-swift

import Foundation

public struct Info {
    
    public init() { }
    
    static private let defaults = UserDefaults.standard
    
    // Holds a reference to the Info.plist of the app as a Dictionary
    static private let infoPlistDictionary = Bundle.main.infoDictionary
    
    // Retrieves and returns associated values (of Type String) from info.Plist of the app.
    static private func readFromInfoPlist(withKey key: String) -> String? {
        return infoPlistDictionary?[key] as? String
    }
    
    /// Returns the app bundle name of the current project.
    static public var appName: String {
        return readFromInfoPlist(withKey: "CFBundleName") ?? "(unknown app name)"
    }
    
    /// Returns the bundle's short version number of the current project.
    static public var version: String {
        return readFromInfoPlist(withKey: "CFBundleShortVersionString") ?? "(unknown app version)"
    }
    
    /// Returns the bundle's version (i.e. build number) of the current project.
    static public var build: String {
        return readFromInfoPlist(withKey: "CFBundleVersion") ?? "(unknown build number)"
    }
    
    /// Returns the minimum OS version for the current project.
    static public var minimumOSVersion: String {
        return readFromInfoPlist(withKey: "MinimumOSVersion") ?? "(unknown minimum OSVersion)"
    }
    
    /// Returns a human readable version of the copyright notice.
    static public var copyrightNotice: String {
        return readFromInfoPlist(withKey: "NSHumanReadableCopyright") ?? "(unknown copyright notice)"
    }
    
    /// Returns the Bundle Identifier for the current project.
    static public var bundleIdentifier: String {
        return readFromInfoPlist(withKey: "CFBundleIdentifier") ?? "(unknown bundle identifier)"
    }
    
    /// Returns the developer name associated with the project.
    /// Be sure to first set the developer name via the ```setDeveloperName(:)``` function.
    /// This will only need to be set once.
    static public var developer: String {
        return defaults.string(forKey: "appDeveloperName") ?? "unknown developer name"
    }
    
    /// Sets the developer name.
    /// Saves to user defaults.
    /// - Parameter name: The name to be assosiated with the project.
    static public func setDeveloperName(_ name: String) {
        defaults.set(true, forKey: "appDeveloperName")
    }
    
    /// Determines if the app is being launched for the first time.
    ///
    /// - Returns: A Boolean, false if it is the first time, true otherwise.
    static public func hasAppAlreadyLaunchedOnce() -> Bool {
        if let _ = defaults.string(forKey: "isAppAlreadyLaunchedOnce") {
            print("App already launched")
            return true
        } else {
            defaults.set(true, forKey: "isAppAlreadyLaunchedOnce")
            print("App launched first time")
            return false
        }
    }

    /// Returns the number of times the app has been launched.
    static public func launchCount() -> Int {
        let defaults = UserDefaults.standard
        var count = defaults.integer(forKey: "appLaunchCount")
        defaults.set(count + 1, forKey: "appLaunchCount")
        print("App launch count: \(count)")
        return count
    }
    
}
