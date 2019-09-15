//
//  ListViewController.swift
//  Alert
//
//  Created by MC975-107 on 15/09/2019.
//  Copyright © 2019 comso. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    
    var delegate: MapAlertViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.preferredContentSize.height = 220
        // 내용이 많아도 알림창에 표시될 수 있도록 높이 값을 높게 지정
    }
    // 일반적인 경우라면 우선 리스트를 구성할 배열 데이터부터 생성해야겠지만, 여기서는 커스터마이징 자체에 집중하기 위해 고정된 행 다섯 개를 생성하고, 각 행은 행번호와 연결된 문구를 표현하는 것으로 간단히 처리
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel!.text = "\(indexPath.row) 번째 옵션입니다."
        cell.textLabel?.font = UIFont.systemFont(ofSize: 13)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.didSelectRowAt(indexPath: indexPath)
    }
}
