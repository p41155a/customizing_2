//
//  AppDelegate.swift
//  TabBar
//
//  Created by MC975-107 on 13/09/2019.
//  Copyright © 2019 comso. All rights reserved.
//

import UIKit

// 새로운 앱 델리게이트 클래스를 만들었기 때문
//@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // 윈도우 객체에 연결된 루트 뷰 컨트롤러를 읽어와 UITabBarController로 캐스팅
        if let tbC = self.window?.rootViewController as? UITabBarController {
            // 탭 바로부터 탭 바 아이템 배열을 가져옴
            if let tbItems = tbC.tabBar.items {
                // 탭 바 아이템에 등록된 커스텀 이미지에는 기본적으로 템플릿 이미지 모드가 적용되기 때문에 원래의 색상 정보는 모두 무시된다
                // 우리는 원본 이미지의 색상을 적용하기 위해서 소스를 주석처리 한다
                //tbItems[0].image = UIImage(named: "calender")
                //tbItems[1].image = UIImage(named: "file-three")
                //tbItems[2].image = UIImage(named: "photo")
                
                tbItems[0].image = UIImage(named: "designbump")?.withRenderingMode(.alwaysOriginal)
                tbItems[1].image = UIImage(named: "rss")?.withRenderingMode(.alwaysOriginal)
                tbItems[2].image = UIImage(named: "facebook")?.withRenderingMode(.alwaysOriginal)
                
                for tbItem in tbItems {
                    let image = UIImage(named: "checkmark")?.withRenderingMode(.alwaysOriginal)
                    tbItem.selectedImage = image
                    // 외형 프록시 객체를 쓰는 것이 전체를 순회하지 않고도 콩통으로 속성을 적용할 수 있에 아래의 소스를 주석 처리
                    //tbItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .disabled)
                    //tbItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .selected)
                    //tbItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)], for: .normal)
                }
                
                let tbItemProxy = UITabBarItem.appearance()
                tbItemProxy.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .selected)
                tbItemProxy.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .disabled)
                tbItemProxy.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)], for: .normal)
                
                tbItems[0].title = "Calendar"
                tbItems[1].title = "File"
                tbItems[2].title = "Photo"
            }
            //tbC.tabBar.tintColor = .white
            //tbC.tabBar.backgroundImage = UIImage(named: "menubar-bg-mini")
            
            let tbProxy = UITabBar.appearance()
            tbProxy.tintColor = UIColor.white
            tbProxy.backgroundImage = UIImage(named: "menubar-bg-mini")
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

