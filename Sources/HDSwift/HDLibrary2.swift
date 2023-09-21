//
//  File.swift
//  
//
//  Created by denglibing on 2023/9/20.
//

import Foundation
import UIKit

public class HDLibrary2: NSObject {
    public static func printInfo() {
        debugPrint("HDLibrary2 printInfo4")
        
    }
    
    public func libImage(_ name: String) -> UIImage? {
        let bundle = Bundle(for: type(of: self))
        
        let image = UIImage(named: name, in: bundle, compatibleWith: nil)
        return image
    }
}
