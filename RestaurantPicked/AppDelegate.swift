//
//  AppDelegate.swift
//  RestaurantPicked
//
//  Created by Sejin on 2023/05/12.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // 네비바 설정
        let apperance = UINavigationBarAppearance()
        apperance.configureWithDefaultBackground()  // 네비게이션바 불투명으로 설정
        // navigationBar apperance 설정
        UINavigationBar.appearance().standardAppearance = apperance
        // 기본 색상 및 외형 설정
        apperance.backgroundColor = .white  // 네비게이션바 색상 설정
        UINavigationBar.appearance().tintColor = .darkGray  // 네비게이션바 tint색생 설정
        UINavigationBar.appearance().shadowImage = UIImage()  // 구분선 제거
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        // title 설정
        UINavigationBar.appearance().prefersLargeTitles = true  // large title
        apperance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.darkGray]  // title 색상 설정
        apperance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.darkGray]  // title 색상 설정
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

