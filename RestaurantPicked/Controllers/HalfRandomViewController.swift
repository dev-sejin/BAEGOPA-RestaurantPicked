//
//  HalfRandomViewController.swift
//  RestaurantPicked
//
//  Created by Sejin on 2023/05/15.
//

import UIKit

class HalfRandomViewController: UIViewController {
    
    // MARK: - Properties
    
    // view 생성
    private let halfRandomView = HalfRandomView()
    // view 교체
    override func loadView() {
        view = halfRandomView
    }

    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtonAction()
        configureNaiBar()
    }
    
    
    // MARK: - Helpers Functions
    
    // button을 작동하기 위해서 addTarget 설정
    private func configureButtonAction() {
        let buttons = [halfRandomView.koreanButton, halfRandomView.chinessButton, halfRandomView.japaneseButton, halfRandomView.westernButton, halfRandomView.cafeButton, halfRandomView.barButton]
        buttons.forEach { button in
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        }
    }

    
    private func configureNaiBar() {
        title = "Random Restaurant"
        // settingBarButtonItem 생성 및 설정
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.2.badge.gearshape"), style: .plain, target: self, action: #selector(settingButtonTapped))
    }
    
    
    // MARK: - Selectors
    
    @objc func settingButtonTapped() {
        // 디테일뷰컨 생성
        let controller = SettingViewController()
        // 네비게이션컨트롤러를 이용한 화면이동
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    @objc func buttonTapped(_ sender: UIButton) {
        
        let controller = RestaurantDetailViewController()
        // 눌린 버튼 타이틀 RestaurantDetailViewController로 넘겨 주기
        if let title = sender.currentTitle {
            controller.tappedButtonTitle = title
        }
        
        // 네비게이션컨트롤러를 이용한 또다른 화면이동 코드방식
        show(controller, sender: nil)
    }
    
    
    // MARK: - Actions
    
    // MARK: - Extension

    
}
