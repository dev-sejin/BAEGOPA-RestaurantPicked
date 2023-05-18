//
//  SceneDelegate.swift
//  RestaurantPicked
//
//  Created by Sejin on 2023/05/12.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        // 탭바컨트롤러의 생성
        let tabBarVC = UITabBarController()
        // 네비컨트롤러 생성
        let randomVC = UINavigationController(rootViewController: RandomViewController())
        let halfRandomVC = UINavigationController(rootViewController: HalfRandomViewController())
        
        // 탭바 타이틀 설정
        randomVC.title = "Random"
        halfRandomVC.title = "Category Random"
        
        // 탭바로 사용하기 위한 뷰 컨트롤러들 설정
        tabBarVC.setViewControllers([randomVC, halfRandomVC], animated: true)
        
        // 프리젠테이션될 화면 스타일 설정
        tabBarVC.modalPresentationStyle = .fullScreen
        
        // 탭바의 백그라운드색상 설정
        tabBarVC.tabBar.backgroundColor = .white
        
        // 탭바 이미지 설정 (이미지는 애플이 제공하는 것으로 사용)
        guard let items = tabBarVC.tabBar.items else { return }
        items[0].image = UIImage(systemName: "fork.knife")
        items[1].image = UIImage(systemName: "globe.asia.australia")
        
        // 탭바 틴트색상 설정
        tabBarVC.tabBar.tintColor = .black  // 선택된 tabbar 색상
        tabBarVC.tabBar.unselectedItemTintColor = .gray  // 선택되지 않은 tabbar 색상
        
        // 기본루트뷰를 탭바컨트롤러로 설정
        window?.rootViewController = tabBarVC
        
        // window를 표시하고 Key window로 설정(window를 앞으로 배치)
        // key window: window가 여러개 존재할 때, 가장 앞쪽에 배치된 window를 `key window`라고 지칭
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

