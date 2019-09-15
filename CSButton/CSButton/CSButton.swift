
//
//  CSButton.swift
//  CSButton
//
//  Created by MC975-107 on 15/09/2019.
//  Copyright © 2019 comso. All rights reserved.
//

import UIKit

// 버튼 타입을 결정하는 열거형
public enum CSButtonType {
    case rect
    case circle
}

class CSButton: UIButton {
    // 스토리보드 방식으로 객체를 생성할 때 호출되는 초기화 메소드
    required init?(coder aDecoder: NSCoder) {
        // 상위 클래스의 동일한 초기화 메소드에서 처리하는 내용을 누락시키지 않기 위해
        // 부모의 초기화 메소드를 내부적으로 호출
        super.init(coder: aDecoder)
        
        // 스토리보드 방식으로 버튼을 정의했을 때 적용 됩니다.
        self.backgroundColor = UIColor.green
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        self.setTitle("버튼", for: .normal)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.gray
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 2
        self.setTitle("코드로 생성된 버튼", for: .normal)
    }
    init() {
        super.init(frame: CGRect.zero)
    }
    convenience init(type: CSButtonType) {
        self.init()
        
        switch type {
        case .rect:
            self.backgroundColor = UIColor.black
            self.layer.borderColor = UIColor.black.cgColor
            self.layer.borderWidth = 2
            self.layer.cornerRadius = 0
            self.setTitleColor(UIColor.white, for: .normal)
            self.setTitle("Rect Button", for: .normal)
        case .circle:
            self.backgroundColor = UIColor.red
            self.layer.borderColor = UIColor.black.cgColor
            self.layer.borderWidth = 2
            self.layer.cornerRadius = 50
            self.setTitle("Circle Button", for: .normal)
        }
        // 액션 메소드를 지정
        self.addTarget(self, action: #selector(counting(_:)), for: .touchUpInside)
    }
    var style: CSButtonType = .rect {
        didSet {
            switch style {
            case .rect :
                self.backgroundColor = UIColor.black // 배경을 검은색으로
                self.layer.borderColor = UIColor.black.cgColor // 테두리는 검은색으로
                self.layer.borderWidth = 2 // 테두리 두께는 2
                self.layer.cornerRadius = 0 // 모서리는 전혀 둥글지 않게
                self.setTitleColor(UIColor.white, for: .normal) // 글씨는 흰색으로
                self.setTitle("Rect Button", for: .normal) // 기본 문구 설정
            case .circle :
                self.backgroundColor = UIColor.red // 배경을 빨간색으로
                self.layer.borderColor = UIColor.blue.cgColor
                self.layer.borderWidth = 2
                self.layer.cornerRadius = 50 // 50만큼 둥글게 처리
                self.setTitle("Circle Button", for: .normal)
            }
        }
    }
    // 버튼이 클릭된 횟수를 카운트하여 타이틀에 표시해 주는 함수
    @objc func counting(_ sender: UIButton) {
        sender.tag = sender.tag + 1
        sender.setTitle("\(sender.tag) 번째 클릭", for: .normal)
    }
}
