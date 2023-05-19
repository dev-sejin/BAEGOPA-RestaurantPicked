//
//  RestaurantDetailViewController.swift
//  RestaurantPicked
//
//  Created by Sejin on 2023/05/15.
//

import UIKit
import CoreLocation
import MapKit

class RestaurantDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    // UI 관련된 변수들
    // view 생성
    private let restaurantDetailView = RestaurantDetailView()
    // view 교체
    override func loadView() {
        view = restaurantDetailView
    }
    
    // 위치 관련 변수들
    // CLLocationManager
    private let locationManager = CLLocationManager()
    // 사용자의 현재 위치를 담아 두는 변수
    private var myLocation = CLLocation()
    
    // 데이터 전달 관련 변수들
    // basic webViewURL (sheet로 전달할)
    private var webViewURL = "https://m.search.naver.com/search.naver?sm=tab_hty.top&where=m&query="
    // halfrandom의 버튼 타이틀 전달 받을 변수
    var tappedButtonTitle: String = ""
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNaviBar()
        configureLocationData()
        configureMapView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 화면이 나타날때 tabbar 숨기기
        tabBarController?.tabBar.isHidden = true
    }
    
    // 화면이 사라질때 다시 tabbar 나타나기
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    
    // MARK: - Helpers Functions
    
    // 네비바 설정
    private func configureNaviBar() {
        title = "식당 상세정보"
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    // 위지정보 설정
    private func configureLocationData() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest  // 위치 정확도 품질 설정
        locationManager.startUpdatingLocation()
        // 전역변수에 사용자의 현재 위치 할당
        if let location = locationManager.location {
            myLocation = location
        }
    }
    
    // 맵뷰 설정
    private func configureMapView() {
        restaurantDetailView.mapView.delegate = self
        restaurantDetailView.mapView.showsUserLocation = true  // 위치 사용 시 사용자의 현재 위치를 표시
//        restaurantDetailView.mapView.setUserTrackingMode(.followWithHeading, animated: true)  // 현재 화면을 사용자 위치로 이동 및 확대. (애니메이션 효과로 부드러운 화면 이동)
    }
    
}


// MARK: - Extension

// extension CLLocationManagerDelegate Methods
extension RestaurantDetailViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // 마지막으로 받은 위치정보를(위도와 경도 정보를 담고 있다) 상수에 할당 및 옵셔널 바인딩
        if let location = locations.last {
            
            // 계속해서 위치정보를 가져오는 것을 멈추기
            //            locationManager.stopUpdatingLocation()
            
            let lon = String(location.coordinate.longitude)  // 경도 정보
            let lat = String(location.coordinate.latitude)  // 위도 정보
            let coord = "\(lon),\(lat)"
            print(coord)
            
            // ReverseGeocodingAPI (좌표 to 주소)
            ReverseGeocodingAPI.shared.getDataFromAPI(coord: coord) { [unowned self] data in
                let city = data.results[0].region.area1.name
                let district = data.results[0].region.area2.name
                let street = data.results[0].region.area3.name
                let string = "\(city) \(district) \(street) 맛집"
                self.webViewURL.append(street)  // webViewURL 뒤에 주소(동) 추가 (검색 정확도 또는 이름이 같은 식당이 있을 경우를 대비해서)
                print(string)
                
                // SearchLocationAPI (주소+맛집 식당검색)
                SearchLocationAPI.shared.requestLocation(searchQuery: string) { [unowned self] data in
                    
                    // 네이버 지역 검색 결과를 이용해 랜덤 장소 요청
                    let selectedRestaurant = SearchLocationAPI.shared.getRandomLocation()
                    // 네이버 지역 검색 결과를 이용해 구한 랜덤 장소의
                    // TM128 좌표계를 변환 후 WGS84(위도, 경도) 좌표 요청
                    guard let selectedRestaurantCoord = SearchLocationAPI.shared.getRandomLocationCoordinate() else { return }
                    
                    // 데이터 할당 과정
                    // 식당 레이블 설정
                    if let title = selectedRestaurant?.title {
                        self.restaurantDetailView.restaurantNameLabel.text = title
                        print(title)
                        self.webViewURL.append(title)  // webViewURL 완성
                    }
                    
                    // annotation 생성
                    let restaurnt = SelectRestaurantAnnotaion(title: selectedRestaurant?.title, locationName: selectedRestaurant?.address, discipline: selectedRestaurant?.category, coordinate: selectedRestaurantCoord)
                    restaurantDetailView.mapView.addAnnotation(restaurnt)
                    
                    // Visible Area 설정
                    // 좌표 기준에서 부터 거리(m)를 반영하여 맵의 크기를 가진 객체 생성
                    let coordinateRegion = MKCoordinateRegion(center: selectedRestaurantCoord, latitudinalMeters: 1500, longitudinalMeters: 1500)
                    restaurantDetailView.mapView.setRegion(coordinateRegion, animated: false)
                    
                    // 카메라 제약 설정
                    let center = selectedRestaurantCoord
                    let region = MKCoordinateRegion(center: center, latitudinalMeters: 5000, longitudinalMeters: 6000)
                    restaurantDetailView.mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region), animated: true)
                    let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200000)
                    restaurantDetailView.mapView.setCameraZoomRange(zoomRange, animated: false)
                }
            }
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(String(describing: error))
    }
}


// extension MKMapViewDelegate Methods
extension RestaurantDetailViewController: MKMapViewDelegate {
    
    /*
     annotation view 설정 (마커를 탭하면 작은 사각형 말풍선인 콜아웃이 표시되는 것)
     맵에 annotation들이 추가 될때마다 아래 메서드가 call 된다.
     tableView(_:cellForRowAt:) 메서드와 동일한 역할
     */
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // 현재 위치 표시(점)도 일종에 어노테이션이기 때문에, 이 처리를 안하게 되면, 유저 위치 어노테이션도 변경 된다.
        guard !annotation.isKind(of: MKUserLocation.self) else { return nil }
        
        // annotaion 타입을 확인하여 해당 없을 경우 기본 annotaion view 적용되도록
        guard let annotaion = annotation as? SelectRestaurantAnnotaion else { return nil }
        //
        let identifier = "RandomRestaurant"
        var view: MKMarkerAnnotationView
        // 재사용할 annotaion view를 identifier 통해서 먼저 확인
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            // 새로운 annotaion view(MKMarkerAnnotationView) 생성 및 설정
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            
            // rightCalloutAccessoryView 버튼 이미지 변경 설정
//            let mapsButton = UIButton(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 35, height: 35)))
//            mapsButton.setBackgroundImage(UIImage(systemName: "figure.walk.motion"), for: .normal)
//            view.rightCalloutAccessoryView = mapsButton
            
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
    
    
    // annotation rightCalloutAccessoryView Button 클릭시 콜
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        guard let selectRestaurantAnnotaion = view.annotation as? SelectRestaurantAnnotaion else { return }
        
        // 경로 팝업
//        let lanuchOtions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeWalking]
//        selectRestaurantAnnotaion.mapItem?.openInMaps(launchOptions: lanuchOtions)
        
        // SheetView 팝업
        showSheetView()
    }
    
    
    // SheetView 설정 및 이동
    func showSheetView() {
        // sheet 뷰컨 생성
        let sheetVC = SheetViewController()
        
        // presentationStyle 설정
        sheetVC.modalPresentationStyle = .pageSheet
        
        // detents 설정 (sheet 높이 설정)
        if let sheet = sheetVC.sheetPresentationController {
            sheet.detents = [.medium(), .large()]  // 하프 & 풀 모두 배열에 넣어 필요에 따라 자유롭게 사용가능 하도록 설정
            sheet.prefersGrabberVisible = true  // 잡아서 끌 수 있는 Grabber 설정 (기본값 false)
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false  // 스크롤이 가능한 content를 담고 있을 경우, 스크롤시 1. detent를 먼저 확장 2. 스크롤 기능 활성화 된다. 기본값 true, false로 변경시 스크롤 기능을 먼저 수행
        }
        
        // url 전달
        sheetVC.webViewURL = webViewURL
        
        // 화면 이동
        self.present(sheetVC, animated: true)
    }
    
}
