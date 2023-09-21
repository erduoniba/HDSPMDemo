//
//  File.swift
//  
//
//  Created by denglibing on 2023/9/21.
//

import Foundation

private class BundleToken {}

extension Bundle {
    // This is copied method from SPM generated Bundle.module for CocoaPods support
    public static func sm_frameworkBundle() -> Bundle {

        let candidates = [
            // Bundle should be present here when the package is linked into an App.
            Bundle.main.resourceURL,

            // Bundle should be present here when the package is linked into a framework.
            Bundle(for: BundleToken.self).resourceURL,

            // For command-line tools.
            Bundle.main.bundleURL,
        ]

        let bundleNames = [
            // For Swift Package Manager
            "HDLibrary_HDOCLibrary",
        ]

        for bundleName in bundleNames {
            for candidate in candidates {
                let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
                if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                    return bundle
                }
            }
        }

        // Return whatever bundle this code is in as a last resort.
        return Bundle(for: BundleToken.self)
    }
}
