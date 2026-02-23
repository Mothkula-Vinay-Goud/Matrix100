//
//  ViewController.swift
//  Matrix100
//
//  Created by Vinay Goud Mothkula on 2/23/26.
//

import UIKit

class ViewController: UIViewController {
    
    var objCollectionView: UICollectionView?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 2
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        let totalSpacing = 4 * spacing
        layout.itemSize = CGSize(width: (view.frame.width - totalSpacing) / 5, height: 80)
        
        objCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        objCollectionView?.backgroundColor = .white
        objCollectionView?.translatesAutoresizingMaskIntoConstraints = false
        objCollectionView?.register(MatrixCollectionViewCell.self, forCellWithReuseIdentifier: "MatrixCollectionViewCell")
        objCollectionView?.dataSource = self
        objCollectionView?.delegate = self
        
        addSubviewConstraints()
        
        
    }
    func addSubviewConstraints() {
        guard let objCollectionView else { return }
        
        view.addSubview(objCollectionView)
        NSLayoutConstraint.activate([
            objCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            objCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            objCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            objCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MatrixCollectionViewCell", for: indexPath) as! MatrixCollectionViewCell
        let val = indexPath.row + 1
        cell.label.text = "\(indexPath.row + 1)"
        cell.backgroundColor = .black
        if val % 5 == 0 && val % 3 == 0{
            cell.backgroundColor = .green
        }else if val%5 == 0{
            cell.backgroundColor = .red
        }else if val%3 == 0{
            cell.backgroundColor = .blue
        }
        
        return cell
        
        
        
        
        
//        cell.contentView.subviews.forEach{$0.removeFromSuperview()}
//        let label = UILabel(frame: cell.contentView.bounds)
//        cell.contentView.addSubview(label)
//        let val = indexPath.row + 1
//        label.text = "\(val)"
//        label.textColor = .white
//        label.backgroundColor = .black
//        label.textAlignment = .center
//        if val % 5 == 0 && val % 3 == 0{
//            label.backgroundColor = .green
//        }else if val%5 == 0{
//            label.backgroundColor = .red
//        }else if val%3 == 0{
//            label.backgroundColor = .blue
//        }
        
    }
}
