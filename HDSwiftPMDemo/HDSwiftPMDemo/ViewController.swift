//
//  ViewController.swift
//  HDSwiftPMDemo
//
//  Created by denglibing on 2023/9/20.
//

import UIKit
import Alamofire
import HDSwiftLibrary
import HDOCLibrary
import Charts

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 直接使用Alamofire的方法
        AF.request("https://httpbin.org/get").response { response in
            debugPrint("AF")
            debugPrint(response)
        }
        
        // 使用自定义的SPM的方法，内部调用Alamofire
        HDLibrary().printAFInfo()
        // 使用自定义的SPM的方法，多个类测试验证
        HDLibrary2.printInfo()
        
        HDOCLibrary.ocPrint()
        
        // 参考 https://github.com/SwiftKickMobile/SwiftMessages
        let bundle = Bundle.sm_frameworkBundle()
        let image = UIImage(named: "on_demo", in: bundle, with: nil)
        let imageView = UIImageView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        view.addSubview(imageView)
        imageView.image = image
        
        if let path = bundle.path(forResource: "SH/translate", ofType: "sh") {
            let shString = try? String(contentsOfFile: path)
            debugPrint("sh: \(shString)")
        }
    }
}

