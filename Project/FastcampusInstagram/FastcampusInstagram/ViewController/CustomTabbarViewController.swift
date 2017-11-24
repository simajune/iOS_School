
import UIKit

enum naviType: Int {
    case navi
    case navi1
    case navi2
    case navi3
    case navi4
}

class CustomTabbarViewController: UITabBarController, PhotoSelectorControllerDelegate {
    
    func photoselectorDidSelectedImage(_ selectedImgae: UIImage) {
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tabbarVCs()
        tabBar.tintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        self.delegate = self
    }

  func tabbarVCs(){

    let mainSB = UIStoryboard(name: "Main", bundle: nil)
    let mainVC = mainSB.instantiateViewController(withIdentifier: "Main") as! MainViewController
    
    
    let navi = MainViewController().makeVc(viewcontroller: mainVC, selectImg: "home_selected", deSelectImg: "home_unselected")

    let navi1 = UIViewController().makeVc(viewcontroller: UIViewController(), selectImg: "search_selected", deSelectImg: "search_unselected")
    
    
    let navi2 = UIViewController().makeVc(viewcontroller: UIViewController(), selectImg: "plus_unselected", deSelectImg: "plus_unselected")
    let navi3 = UIViewController().makeVc(viewcontroller: UIViewController(), selectImg: "like_selected", deSelectImg: "like_unselected")
    let navi4 = ProfileViewController().makeVc(viewcontroller: ProfileViewController(), selectImg: "profile_selected", deSelectImg: "profile_unselected")

    self.viewControllers = [navi, navi1, navi2, navi3, navi4]
  }
}

extension UIViewController {
    func makeVc(viewcontroller: UIViewController, selectImg: String, deSelectImg: String) -> UINavigationController {
        viewcontroller.tabBarItem.selectedImage = UIImage(named: selectImg)
        viewcontroller.tabBarItem.image = UIImage(named: deSelectImg)
        viewcontroller.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        let navi = UINavigationController(rootViewController: viewcontroller)
        return navi
    }
}

extension CustomTabbarViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        let index = tabBarController.viewControllers?.index(of: viewController)
        let int: naviType = naviType(rawValue: index!)!
        
        switch int {
        case .navi2:
            let picker = PhotoPlusCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
            let navi = UINavigationController(rootViewController: picker)
            
            self.present(navi, animated: true, completion: nil)
            return false
        default:
            print(tabBarController.selectedIndex)
            return true
        }
    }
}

