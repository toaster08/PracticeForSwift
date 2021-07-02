//
//  ViewController.swift
//  CollectionSample
//
//  Created by toaster on 2021/07/02.
//

import UIKit

class ViewController: UIViewController {
    
    
    let photos = ["1","2","3","4","5","6","7","8","9"]

    @IBOutlet weak var collectionView: UICollectionView!
    
    var selectedImage:UIImage!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
                
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        collectionView.collectionViewLayout = layout
        
    }
}

extension ViewController:UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return photos.count
    }
    
}

extension ViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        let cellImage = UIImage(named:photos[indexPath.row])
        imageView.image = cellImage
        
        let label = cell.contentView.viewWithTag(2) as! UILabel
        label.text = photos[indexPath.row]
        label.textColor = UIColor.white
        

        
        return cell
        
//        cell.backgroundColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
//        return cell
//    }
    }
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectedImage = UIImage(named: photos[indexPath.row])
        if selectedImage != nil {
            performSegue(withIdentifier: "toSecondViewController", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toSecondViewController"){
            let secondVC:SecondViewController = (segue.destination as? SecondViewController)!
            secondVC.selectedImg = selectedImage
        }
    }
}

extension ViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let horizontalSpace:CGFloat = 1
        let cellSize:CGFloat = self.view.bounds.width/3 - horizontalSpace
        return CGSize(width: cellSize,height: cellSize)
    }
}

