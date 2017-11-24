
import Photos
import UIKit

private let reuseIdentifier = "Cell"

class PhotoPlusCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

  var headerImg: UIImage?
  var images:[UIImage] = []
  var assets:[PHAsset] = []
  
    override func viewDidLoad() {
        super.viewDidLoad()

      collectionView?.backgroundColor = .white
      self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "사진올리기", style: .plain, target: self, action: #selector(naviBtnNext))
      self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(naviLeftBtnCancel))

      self.collectionView!.register(PhotoSelectorCell.self, forCellWithReuseIdentifier: reuseIdentifier)
      self.collectionView!.register(PhotoSelectorCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: reuseIdentifier)
      
      fetchPhoto()
      
      let fixHeader = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
      fixHeader?.sectionHeadersPinToVisibleBounds = true
      
    }

  // MARK: - navitbtn action
  @objc func naviLeftBtnCancel(){
    self.dismiss(animated: true, completion: nil)
  }
  
  @objc func naviBtnNext(){
    let vc = UIStoryboard(name: "Main", bundle: nil)
    if let writeVc = vc.instantiateViewController(withIdentifier: "Write") as? WriteViewController {
      writeVc.senderImg = headerImg
      self.navigationController?.pushViewController(writeVc, animated: true)
    }
    
  }
  
  
    // MARK: - PHAsset
  
  private func fetchPhoto()
  {
    //PHFetchOptions 옵션 설정 가능!
    
    //PHAsst을 통해 앨범의 assets 데이터 가져오기
    DispatchQueue.global().async {
      let fetchOption = PHFetchOptions()
      fetchOption.fetchLimit = 20
      let sortDescriptor = NSSortDescriptor(key: "creationDate", ascending: false)
      fetchOption.sortDescriptors = [sortDescriptor]
      let photos = PHAsset.fetchAssets(with: .image, options: fetchOption)
      
      //enumerateObjects 메소드를 통해 각 asset을 하나씩 작업 실행하기
      photos.enumerateObjects { (asset, count, stop) in
        //각 asset별: PHImageManager를 통해 이미지 불러오기 requestImage
        let manager = PHImageManager()
        
        let targetSize = CGSize(width: 200, height: 200)
        let option = PHImageRequestOptions()
        option.isSynchronous = true
        
        manager.requestImage(for: asset, targetSize: targetSize, contentMode: .aspectFill, options: option, resultHandler: { (image, info) in

          if let image = image {
            self.images.append(image)
            self.assets.append(asset)
            if self.headerImg == nil {
              self.headerImg = image
            }
          }
          if count == photos.count - 1 {
            DispatchQueue.main.async {
              self.collectionView?.reloadData()
            }
          }
        })
      }
    }
  }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return images.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoSelectorCell
        cell.photoImageView.image = images[indexPath.item]
    
        return cell
    }
  
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
      let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoSelectorCell
      header.photoImageView.image = headerImg
      return header
  }
  

  
  //Mark : - Delegate
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    self.headerImg = images[indexPath.item]
    self.collectionView?.reloadData()
  }
  
   //Mark : - Layout
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: view.bounds.size.width, height: view.bounds.size.width)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: (view.bounds.size.width - 3) / 4, height: (view.bounds.size.width - 3) / 4)
  }


}
