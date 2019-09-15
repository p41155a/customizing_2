//
//  MapAlertViewController.swift
//  Alert
//
//  Created by MC975-107 on 14/09/2019.
//  Copyright © 2019 comso. All rights reserved.
//

import UIKit
import MapKit
class MapAlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let alertBtn = UIButton(type: .system)
        alertBtn.frame = CGRect(x: 0, y: 150, width: 100, height: 30)
        alertBtn.center.x = self.view.frame.width/2
        alertBtn.setTitle("Map Alert", for: .normal)
        alertBtn.addTarget(self, action: #selector(mapAlert(_:)), for: .touchUpInside)
        self.view.addSubview(alertBtn)
        
        // 이미지 알림창 버튼 생성
        let imageBtn = UIButton(type: .system)
        imageBtn.frame = CGRect(x: 0, y: 200, width: 100, height: 30)
        imageBtn.center.x = self.view.frame.width / 2
        imageBtn.setTitle("Image Alert", for: .normal)
        imageBtn.addTarget(self, action: #selector(imageAlert(_:)), for: .touchUpInside)
        self.view.addSubview(imageBtn)
        
        // 슬라이더 알림창 버튼 생성
        let sliderBtn = UIButton(type: .system)
        sliderBtn.frame = CGRect(x: 0, y: 250, width: 100, height: 30)
        sliderBtn.center.x = self.view.frame.width / 2
        sliderBtn.setTitle("Slider Alert", for: .normal)
        sliderBtn.addTarget(self, action: #selector(sliderAlert(_:)), for: .touchUpInside)
        self.view.addSubview(sliderBtn)
        
        // 테이블 뷰 알림창 버튼 생성
        let listBtn = UIButton(type: .system)
        listBtn.frame = CGRect(x: 0, y: 300, width: 100, height: 30)
        listBtn.center.x = self.view.frame.width / 2
        listBtn.setTitle("List Alert", for: .normal)
        listBtn.addTarget(self, action: #selector(listAlert(_:)), for: .touchUpInside)
        self.view.addSubview(listBtn)
    }
    
    @objc func mapAlert(_ sender: Any) {
        //let alert = UIAlertController(title: "nil", message: "nil", preferredStyle: .alert)
        let alert = UIAlertController(title: nil, message: "여기가 맞습니까?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        let contentVC = MapKitViewController() // 커스텀 클래스 (지도 관련 주요 내용을 정의한 파일)
        alert.setValue(contentVC, forKeyPath: "contentViewController")
        self.present(alert, animated: false)
    }
    
    @objc func imageAlert(_ sender: Any) {
        let alert = UIAlertController(title:nil, message: "이번 글의 평점은 다음과 같습니다.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        let contentVC = ImageViewController()
        alert.setValue(contentVC, forKeyPath: "contentViewController")
        self.present(alert, animated: false)
    }
    
    @objc func sliderAlert(_ sender: Any) {
        let contentVC = ControlViewController()
        let alert = UIAlertController(title:nil, message: "이번 글의 평점을 입력해주세요.", preferredStyle: .alert)
        alert.setValue(contentVC, forKeyPath: "contentViewController")
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            print(">>> sliderValue = \(contentVC.sliderValue)")
        }
        alert.addAction(okAction)
        self.present(alert, animated: false)
    }
    
    @objc func listAlert(_ sender: Any) {
        let contentVC = ListViewController()
        
        // 델리게이트 객체를 자신으로 지정한다
        contentVC.delegate = self
        
        let alert = UIAlertController(title:nil, message:nil, preferredStyle: .alert)
        alert.setValue(contentVC, forKeyPath: "contentViewController")
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: false)
    }
    
    func didSelectRowAt(indexPath: IndexPath) {
        print(">>> 선택된 행은 \(indexPath.row)입니다")
    }
    // 클릭할때마다 출력되므로 제출 형식으로 출력하는 것이 아니라 받아 올 수 있다만 학습한 것
}
