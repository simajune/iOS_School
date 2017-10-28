
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var jaeum: [String] = ["ㄱ", "ㄴ", "ㄷ", "ㄹ", "ㅁ", "ㅂ", "ㅅ", "ㅇ", "ㅈ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"]
    var number: [String] = []
    var newArray: [String] = []
    var num: Int = 50
    var index: IndexPath?
    var countNum: Int = 0
    var tempNum: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.allowsMultipleSelection = true
        
        
        for index in 1 ... num {
            number.append(String(index))
        }
        
        for list in jaeum {
            newArray.append(list)
        }
        for list in number {
            newArray.append(list)
        }
    }
    
    @IBAction func addAction(_ sender: UIButton) {
        collectionView.performBatchUpdates({
            let indexPath = IndexPath(item: newArray.count, section: 0)
            newArray.append("g")
            collectionView.insertItems(at: [indexPath])
        }, completion: nil)
    }
    
    @IBAction func deleteAction(_ sender: UIButton) {
        if newArray.count > 0 {
            
            if let indexItems = collectionView.indexPathsForSelectedItems {
                
                collectionView.performBatchUpdates({
                        for index in indexItems {
                            if tempNum < index.item {
                                countNum += 1
                            }
                            print(index.item)
                            print(number)
                            
                            newArray.remove(at: index.item - countNum)
                            
                            tempNum = index.item
                    }
                    
                    collectionView.deleteItems(at: indexItems)
            }, completion: nil)}
        }
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DetailCollectionViewCell
        cell.titleLb.text = newArray[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let insetCell = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        return insetCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected")
        let cell = collectionView.cellForItem(at: indexPath)
        
        cell?.backgroundColor = UIColor(red: 0, green: 122/255, blue: 255/255, alpha: 0.5)
        
        index = IndexPath(item: indexPath.item, section: indexPath.section)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor(red: 0, green: 122/255, blue: 255/255, alpha: 1.0)
        print("deselected")
    }

//    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
//        if let selIndexPath = collectionView.indexPathsForSelectedItems?.last, setIndexP {
//
//        }
//    }
//
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width / 4) - 1
        let cellSize = CGSize(width: width, height: width)
        
        return cellSize
        
    }
}
