//
//  NewAppDelegate.swift
//  TabBar
//
//  Created by MC975-107 on 14/09/2019.
//  Copyright © 2019 comso. All rights reserved.
//

import Foundation
import UIKit
@UIApplicationMain
class NewAppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // 탭 바 컨트롤러 생성
        let tbC = UITabBarController()
        tbC.view.backgroundColor = .white
        
        // tbC를 루트 뷰 컨트롤러로 연결
        self.window?.rootViewController = tbC
        
        // 각 탭 바 아이템에 연결된 뷰 컨트롤러 객체를 생성
        let view01 = ViewController()
        let view02 = SecondViewController()
        let view03 = ThirdViewController()
        
        // 생성된 뷰 컨트롤러 객체에게 탭 바 컨트롤러를 등록
        tbC.setViewControllers([view01, view02, view03], animated: false)
        
        // 개별 탭 바 아이템의 속성을 설정
        view01.tabBarItem = UITabBarItem(title: "Calendar", image: UIImage(named: "calendar"), selectedImage: nil)
        view02.tabBarItem = UITabBarItem(title: "File", image: UIImage(named: "file-tree"), selectedImage: nil)
        view03.tabBarItem = UITabBarItem(title: "Photo", image: UIImage(named: "photo"), selectedImage: nil)
        
        return true
    }
}
