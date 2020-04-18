//
//  ViewController.swift
//  ViewControllerGeneratorDemo
//
//  Created by 康志斌 on 2020/4/18.
//  Copyright © 2020 AppChihPin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vcWithXib = ViewControllerCreator.generate(ViewControllerName.withXib.rawValue)
        print(vcWithXib!) // OK
        
        let vcNoXib = ViewControllerCreator.generate(ViewControllerName.noXib.rawValue)
        print(vcNoXib!) // OK
        
        let vcNotExist = ViewControllerCreator.generate(ViewControllerName.notExist.rawValue)
        print(vcNotExist) // nil
        
        let vcAnotherNoXib = ViewControllerCreator.generate(ViewControllerName.anoter.rawValue)
        print(vcAnotherNoXib!) // OK
        
        print("=============================")
        
        let vcWithXib_byConverter = ViewControllerCreator.generateByConverter(ViewControllerName.withXib.rawValue)
        print(vcWithXib_byConverter!) // OK
        
        let vcNoXib_byConverter = ViewControllerCreator.generateByConverter(ViewControllerName.noXib.rawValue)
        print(vcNoXib_byConverter!) // OK
        
        let vcNotExist_byConverter = ViewControllerCreator.generateByConverter(ViewControllerName.notExist.rawValue)
        print(vcNotExist_byConverter) // nil
        
        let vcAnotherNoXib_byConverter = ViewControllerCreator.generateByConverter(ViewControllerName.anoter.rawValue)
        print(vcAnotherNoXib_byConverter!) // OK
    }
}

