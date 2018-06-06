# MapKit

### 1. MapKit이란

- MapKit이란 지도에 관련된 인터페이스를 제공하는 애플에서 제공하는 프레임워크이다.

- MapKit을 쓰는 방법은 다음과 같다.

  ```swift
  import UIKit
  import MapKit
  
  class ViewController: UIViewController {
  }
  ```

- 우선 MapKit을 사용하기 위해선 MapKit 프레임워크를 Import를 시켜주고 스토리보드나 코드를 통해 MapView를 적용시킨다.

  <img src="https://simajune.github.io/img/posting/MapKit1.png" width="600px" height="300px"/>

  

### 2. 용어

- Region : 지역 (MKCoordinateRegion사용)
- Span : 펼쳐진 영역(zoom level) - (MKCoordinateSpan사용)
- Location Coordinate : 좌표
- latitude : 위도 (wgs84 좌표계 사용)
- longitude : 경도 (wgs84 좌표계 사용)



### 3. Center 좌표 설정

```swift
let regionRadius: CLLocationDistance = 1000
let location = CLLocation(latitude: 37.515675, longitude: 127.021378)
let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
regionRadius * 2.0, regionRadius * 2.0)
mapView.setRegion(coordinateRegion, animated: true)

//setLocation Location
let location = CLLocation(latitude: 37.515675, longitude: 127.021378)
let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
let coordinateRegion = MKCoordinateRegionMake(location.coordinate, span)
mapView.setRegion(coordinateRegion, animated: true)
```



### 4. Pin 추가

- MKAnnotation Protocol을 사용하여 annotation 클래스 생성 (NSObject 필수 상속)
- annotation 인스턴스 생성 후 MapView에 Add

```swift
public protocol MKAnnotation : NSObjectProtocol {
	// Center latitude and longitude of the annotation view.
	// The implementation of this property must be KVO compliant.
	public var coordinate: CLLocationCoordinate2D { get }
	// Title and subtitle for use by selection UI.
	optional public var title: String? { get }
	optional public var subtitle: String? { get }
}
```

- annotation은 커스텀하게도 만들 수 있다.

- ```swift
  class CustomAnnotation:NSObject, MKAnnotation {
  	var coordinate: CLLocationCoordinate2D
  	var title: String?
  	var subtitle: String?
  	init(title: String, coordinate: CLLocationCoordinate2D) {
  		self.title = title
  		self.coordinate = coordinate
  	}
  }
  
  let customPin = CustomAnnotation(title: "Sample", coordinate: location.coordinate)
  mapview.addAnnotation(customPin)
  ```

  

### 5. MKMapViewDelegate

```swift
func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
	if let annotation = annotation as? CustomAnnotation {
		let identity = "pin"
		var pinView: MKPinAnnotationView
		if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identity) as? MKPinAnnotationView {
			dequeuedView.annotation = annotation
			pinView = dequeuedView
		} else {
			pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identity)
			pinView.canShowCallout = true
			pinView.calloutOffset = CGPoint(x: -5, y: 5)
			pinView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView
		}
		return pinView
	}
	return nil
}

func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
	///callout Action
}
```



### 6. 사용자 위치 설정

- 사용자 허용

  1. info.plist 항목 추가 (택1) - iOS 10 이상
     1. Privacy - Location When In Use Usage Description : YES 
     2. Privacy - Location Always Usage Description : YES 

- Location Manager 객체 생성 (CLLocationManager)

  let manager = CLLocationManager()

  2. 현 위치 요청 인증
     1. manager.requestAlwaysAuthorization()
     2. manager.requestWhenInUseAuthorization()
  3. 업데이트
     1. manager.startUpdatingLocation()
     2. manager.stopUpdatingLocation()

- **사용자 위치 설정 예제**

```swift
let manager = CLLocationManager()
manager.delegate = self
manager.requestAlwaysAuthorization()
manager.requestWhenInUseAuthorization()
manager.desiredAccuracy = kCLLocationAccuracyBest
manager.startUpdatingLocation()
```



### 7. CLLocationManagerDelegate

```swift
func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
	if let nowLocation = locations.last
	{
		//nowLocation 가지고 위치정보 가져오기
	}
}
```



<img src="https://simajune.github.io/img/posting/MapKit2.png" width="300px" height="500px"/>