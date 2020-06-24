//
//  HomeViewController.swift
//  System-Task
//
//  Created by apple on 6/24/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource {
   
    @IBOutlet weak var collectionviewConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var secondView: UIView!
    
    @IBOutlet weak var heightConstraintSecondView: NSLayoutConstraint!
    
    @IBOutlet weak var tableVieww: UITableView!
    
    @IBOutlet weak var hidebtn: UIButton!
    
    @IBOutlet weak var collectionVieww: UICollectionView!
    
    let imagesArray = ["Guntur","vijaywada","hyderabad","warangal","Nalgonda","vizag"]
    let locationArray = ["Guntur","Vijaywada","hyderabad","warangal","Nalgonda","vizag"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.collectionVieww.delegate = self
        self.collectionVieww.dataSource = self
        self.tableVieww.delegate = self
        self.tableVieww.dataSource = self
        self.tableVieww.reloadData()
        self.hidebtn.addTarget(self, action: #selector(hideViews), for: .touchUpInside)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return locationArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionVieww.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
        cell.ImgVieww.image = UIImage(named: imagesArray[indexPath.row])
        cell.label.text = locationArray[indexPath.row]
        cell.ImgVieww.makeRoundCorners(byRadius: 10)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0{
             print("Guntur")
            let vc = self.storyboard?.instantiateViewController(identifier: "MapViewController") as! MapViewController
            let latitude1 = "16.3067"
            let longtitude1 = "80.4365"
            vc.latitudeValue = Double(latitude1)
            vc.longtitudeValue = Double(longtitude1)
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 1{
            print("vijaywada")
            let vc = self.storyboard?.instantiateViewController(identifier: "MapViewController") as! MapViewController
            let latitude1 = "16.5062"
            let longtitude1 = "80.6480"
            vc.latitudeValue = Double(latitude1)
            vc.longtitudeValue = Double(longtitude1)
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 2{
            print("Hyderabad")
            let vc = self.storyboard?.instantiateViewController(identifier: "MapViewController") as! MapViewController
            let latitude1 = "17.3850"
            let longtitude1 = "78.4867"
            vc.latitudeValue = Double(latitude1)
            vc.longtitudeValue = Double(longtitude1)
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 3{
            print("warangal")
            let vc = self.storyboard?.instantiateViewController(identifier: "MapViewController") as! MapViewController
                       let latitude1 = "17.9689"
                       let longtitude1 = "79.5941"
                       vc.latitudeValue = Double(latitude1)
                       vc.longtitudeValue = Double(longtitude1)
                       self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 4{
           print("Nalgonda")
            let vc = self.storyboard?.instantiateViewController(identifier: "MapViewController") as! MapViewController
                       let latitude1 = "17.0575"
                       let longtitude1 = "79.2684"
                       vc.latitudeValue = Double(latitude1)
                       vc.longtitudeValue = Double(longtitude1)
                       self.navigationController?.pushViewController(vc, animated: true)
        }else{
           print("vizag")
            let vc = self.storyboard?.instantiateViewController(identifier: "MapViewController") as! MapViewController
                       let latitude1 = "17.6868"
                       let longtitude1 = "83.2185"
                       vc.latitudeValue = Double(latitude1)
                       vc.longtitudeValue = Double(longtitude1)
                       self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagesArray.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableVieww.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        cell.imgVieww.image = UIImage(named: imagesArray[indexPath.row])
        cell.addressLbl.text = locationArray[indexPath.row]
        cell.imgVieww.makeRounded()
        cell.imgVieww.contentMode = .scaleToFill
        return cell
       }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
             print("Guntur")
            let vc = self.storyboard?.instantiateViewController(identifier: "MapViewController") as! MapViewController
            let latitude1 = "16.3067"
            let longtitude1 = "80.4365"
            vc.latitudeValue = Double(latitude1)
            vc.longtitudeValue = Double(longtitude1)
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 1{
            print("vijaywada")
            let vc = self.storyboard?.instantiateViewController(identifier: "MapViewController") as! MapViewController
            let latitude1 = "16.5062"
            let longtitude1 = "80.6480"
            vc.latitudeValue = Double(latitude1)
            vc.longtitudeValue = Double(longtitude1)
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 2{
            print("Hyderabad")
            let vc = self.storyboard?.instantiateViewController(identifier: "MapViewController") as! MapViewController
            let latitude1 = "17.3850"
            let longtitude1 = "78.4867"
            vc.latitudeValue = Double(latitude1)
            vc.longtitudeValue = Double(longtitude1)
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 3{
            print("warangal")
            let vc = self.storyboard?.instantiateViewController(identifier: "MapViewController") as! MapViewController
                       let latitude1 = "17.9689"
                       let longtitude1 = "79.5941"
                       vc.latitudeValue = Double(latitude1)
                       vc.longtitudeValue = Double(longtitude1)
                       self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 4{
           print("Nalgonda")
            let vc = self.storyboard?.instantiateViewController(identifier: "MapViewController") as! MapViewController
                       let latitude1 = "17.0575"
                       let longtitude1 = "79.2684"
                       vc.latitudeValue = Double(latitude1)
                       vc.longtitudeValue = Double(longtitude1)
                       self.navigationController?.pushViewController(vc, animated: true)
        }else{
           print("vizag")
            let vc = self.storyboard?.instantiateViewController(identifier: "MapViewController") as! MapViewController
                       let latitude1 = "17.6868"
                       let longtitude1 = "83.2185"
                       vc.latitudeValue = Double(latitude1)
                       vc.longtitudeValue = Double(longtitude1)
                       self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func hideViews(){
        self.secondView.isHidden = true
        self.heightConstraintSecondView.constant = 0
    }
    
    
}

extension UIImageView {
   func makeRoundCorners(byRadius rad: CGFloat) {
      self.layer.cornerRadius = rad
      self.clipsToBounds = true
   }
    func makeRounded() {

          self.layer.borderWidth = 1
          self.layer.masksToBounds = false
          self.layer.borderColor = UIColor.black.cgColor
          self.layer.cornerRadius = self.frame.height / 2
          self.clipsToBounds = true
      }
}
