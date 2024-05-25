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
    
    // Holds a reference to the Info.plist of the app as a Dictionary
    static private let infoPlistDictionary = Bundle.main.infoDictionary
    
    /// Retrieves and returns associated values (of Type String) from info.Plist of the app.
    static private func readFromInfoPlist(withKey key: String) -> String? {
        return infoPlistDictionary?[key] as? String
    }
    
    static public var appName: String {
        return readFromInfoPlist(withKey: "CFBundleName") ?? "(unknown app name)"
    }
    
    static public var version: String {
        return readFromInfoPlist(withKey: "CFBundleShortVersionString") ?? "(unknown app version)"
    }
    
    static public var build: String {
        return readFromInfoPlist(withKey: "CFBundleVersion") ?? "(unknown build number)"
    }
    
    static public var minimumOSVersion: String {
        return readFromInfoPlist(withKey: "MinimumOSVersion") ?? "(unknown minimum OSVersion)"
    }
    
    static public var copyrightNotice: String {
        return readFromInfoPlist(withKey: "NSHumanReadableCopyright") ?? "(unknown copyright notice)"
    }
    
    static public var bundleIdentifier: String {
        return readFromInfoPlist(withKey: "CFBundleIdentifier") ?? "(unknown bundle identifier)"
    }
    
    static public var developer: String {
        return "Kevin Green"
    }
    
    /// Determines if the app is being launched for the first time.
    ///
    /// - Returns: A Bool, false if it's the first time, true otherwise.
    static public func hasAppAlreadyLaunchedOnce() -> Bool {
        let defaults = UserDefaults.standard
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
