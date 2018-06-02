# ImagePicker

### 1. UIImagePickerController

- 다양한 소스로부터 사진을 가져오는 기능이 구현되어있는 클래스

- 사진 소스에는 라이브러리, 사진앨범, 카메라 등이 있다.

- 옵션을 주어 사진을 가져올 때 사용자에게 정사각형으로 편집할 수 있도록 할 수 있다.

  

### 2. 접근권한 요청

- iOS 10에서부터 사용자의 데이터에 접근하기 위해서는 접근 권한을 설정해야만 한다.
- 접근권한은 info.plist에서 설정할 수 있다.
- 항목
  - 미디어 라이브러리 접근 : privacy - Music Usage Description
  - 블루투스 인터페이스 접근 : Privacy - Bluetooth Peripheral Usage Description
  - 달력 접근 : Privacy - Calendar Usage Description
  - 카메라 접근 : Privacy - Camera - Usage Description
  - 위치정보 접근 : Privacy - Location Always and When In...
  - 사진 라이브러리 접근 : Privacy - Photo Library Additions Usage Description



### 3. 사용순서

- UIImagePickerController 인스턴스 생성
- Delegate 설정 (UIImagePickerControllerDelegate, UINavigationControllerDelegate)
- UIImagePicker의 sourceType 설정
- Present



### 4. 예제

```swift
func showImagePicker(_ sender: Any) {
	//1
	let cameraController = UIImagePickerController()
	//2 UIImagePickerControllerDelegate
	// UINavigationControllerDelegate 두개 모두 채택!
	cameraController.delegate = self
	//3 sourceType설정
	cameraController.sourceType = .photoLibrary
	//present
	present(cameraController, animated: true, completion: nil)
}

enum UIImagePickerControllerSourceType : Int {
	case photoLibrary
	case camera
	case savedPhotosAlbum
}

//사진을 선택 후 불리는 델리게이트 메소드
func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
	print(info)
    if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
		self.displayImageView.image = image
	}
	picker.dismiss(animated: true, completion: nil)
}

//취소했을때 불리는 델리게이트 메소드
func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
	picker.dismiss(animated: true, completion: nil)
}

```

