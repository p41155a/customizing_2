
//
//  MapKitViewController.swift
//  Alert
//
//  Created by MC975-107 on 15/09/2019.
//  Copyright © 2019 comso. All rights reserved.
//

import UIKit
import MapKit
class MapKitViewController: UIViewController {

    override func viewDidLoad() {
        let mapkitView = MKMapView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.view = mapkitView
        self.preferredContentSize.height = 200
        let pos = CLLocationCoordinate2D(latitude: 37.630892, longitude: 127.055018)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: pos, span: span)
        mapkitView.region = region // 지도보기로 현재 표시된 영역입니다.
        mapkitView.regionThatFits(region)// 지정된 영역의 종횡비를 조정하여 지도보기의 프레임에 맞도록합니다.
        // regionThatFits 소스를 지워도 같이 동일하게 작동하기 때문에 regionThatFits의 기능을 확실히 알 수 없습니다.
        // 알고 계신 분은 메일로 알려주시면 감사하겠습니다.
        
        let point = MKPointAnnotation()
        point.coordinate = pos
        mapkitView.addAnnotation(point)
    }
}
