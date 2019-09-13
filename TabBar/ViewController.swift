//
//  ViewController.swift
//  TabBar
//
//  Created by MC975-107 on 13/09/2019.
//  Copyright © 2019 comso. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let title = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        
        title.text = "첫 번째 탭"
        title.textColor = .red
        title.textAlignment = .center
        title.font = UIFont.boldSystemFont(ofSize: 14)
        title.sizeToFit() // 콘텐츠의 내용에 맞게 레이블 크기 변경
        title.center.x = self.view.frame.width / 2
        self.view.addSubview(title)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let tabBar = self.tabBarController?.tabBar
        // 아래 소스는 작동은 하나 애니매이션이 없어서 어색
        //tabBar?.isHidden = (tabBar?.isHidden == true) ? false : true
        
        UIView.animate(withDuration: TimeInterval(0.15)) { // 애니메이션 수행시간
            // hidden 속성 사용시 중간값이 없기 때문에 애니매이션처럼 느껴지지 않음
            // alpha는 0.1, 0.2 처럼 중간값이 있기 때문에 alpha를 사용
            tabBar?.alpha = ( tabBar?.alpha == 0 ? 1 : 0 )
        }
    }
}

