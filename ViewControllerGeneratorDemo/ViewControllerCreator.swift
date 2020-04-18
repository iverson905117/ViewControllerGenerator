//
//  ViewControllerCreator.swift
//  ViewControolerCreatorDemo
//
//  Created by 康志斌 on 2020/4/18.
//  Copyright © 2020 AppChihPin. All rights reserved.
//

import UIKit

enum ViewControllerName: String {
    case withXib = "ViewControllerWithXib"
    case noXib = "ViewControllerNoXib"
    case notExist = "ViewControllerNotExist"
    case anoter = "ViewControllerAnotherNoXib"
}

class ViewControllerCreator {
    static func generate(_ className: String) -> UIViewController? {
        if let viewController = className.getViewController() {
            return viewController
        }
        return nil
    }
    
    static func generateByConverter(_ className: String) -> UIViewController? {
        guard let vcType: UIViewController.Type = className.convertToClass() else { return nil }
        return vcType.init()
    }
}

extension String {
    func getViewController() -> UIViewController? {
        if let bundleName = Bundle.main.infoDictionary?["CFBundleName"] as? String {
//            print("BundleName - \(bundleName)")
            if let vcType = NSClassFromString("\(bundleName).\(self)") as? UIViewController.Type {
                return vcType.init(nibName: self, bundle: nil)
            }
        }
        return nil
    }
}

extension String {
    func convertToClass<T>() -> T.Type? {
        guard let nameSpace = Bundle.main.infoDictionary?["CFBundleName"] as? String else { return nil }
        guard let classType = NSClassFromString("\(nameSpace).\(self)") as? T.Type else { return nil }
        return classType
    }
}
