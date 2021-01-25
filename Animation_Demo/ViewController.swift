//
//  ViewController.swift
//  Animation_Demo
//
//  Created by Mujahid on 22/01/21.
//  Copyright © 2021 Individual. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recPt2View: UIView!
    @IBOutlet weak var readyToPlayView: UIStackView!
    @IBOutlet weak var lbGameName: UILabel!
    @IBOutlet weak var lbReadyToPlay: UILabel!
    @IBOutlet weak var recPtView: UIView!
    @IBOutlet weak var walletView: UIView!
    @IBOutlet weak var rec2View: UIView!
    @IBOutlet weak var collectionStackView: UIStackView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var bottomSheetButton: UIButton!
    @IBOutlet weak var itemView: UIStackView!
    @IBOutlet weak var bottomSheetView: UIView!
    @IBOutlet weak var recView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var circleAnimatedView1: UIView!
    @IBOutlet weak var circleAnimatedView2: UIView!
    @IBOutlet weak var stView: UIStackView!
    @IBOutlet weak var lbReadMore: UILabel!
    @IBOutlet weak var lbLoren: UILabel!
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lwButton: UIButton!
    @IBOutlet weak var ptView: UIView!
    @IBOutlet weak var mnView: UIView!
    @IBOutlet weak var squareView: UIView!
    var isClicked:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        mnView.layer.cornerRadius = 12
        squareView.layer.cornerRadius = 12
        mnView.clipsToBounds = true
        ptView.clipsToBounds = true
        lwButton.clipsToBounds = true
        bottomView.isHidden = true
        lwButton.isUserInteractionEnabled = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(onClick))
        mnView.isUserInteractionEnabled = true
        mnView.addGestureRecognizer(tap)
        
        
        
        
    }
    
    
    override func viewDidLayoutSubviews() {
       circleAnimatedView1.layer.cornerRadius = 12
        circleAnimatedView2.layer.cornerRadius = 12
        bottomSheetButton.layer.cornerRadius = 32
        lwButton.layer.cornerRadius = 16
    }
    
    @objc func onClick(){
        self.mnView.isHidden = true
        
        UIView.animate(withDuration: 1.0,delay: 0,options: .curveLinear, animations:{
            
            // SqaureView Moving
            self.squareView.transform = CGAffineTransform(translationX: 16, y: self.ptView.frame.minY)
            let cgPointSquareView = CGPoint(x: -self.ptView.frame.minX, y: -self.ptView.frame.minY)
            self.squareView.frame = CGRect(origin: cgPointSquareView, size: self.squareView.frame.size)
            self.ptView.addSubview(self.squareView)
            self.squareView.clipsToBounds = true
            }){ (t) in
                UIView.animate(withDuration: 2.0, delay: 0,options: .curveEaseInOut, animations:{
                    self.lbTitle.text = "CANDY\nBUST"
                    self.lbTitle.textAlignment = .left
                    self.btnClose.isHidden = false
                    self.stView.isHidden = false
                    self.lbLoren.isHidden = false
                    self.lbReadMore.isHidden = false
                    self.lwButton.isUserInteractionEnabled = true
                }) 
            }
            
        UIView.animate(withDuration: 2.0,delay: 0,options: .curveLinear, animations:{
            self.lwButton.setTitle("Download 30MB", for: .normal)
        // lwRecView Moving
            print(self.ptView.frame.maxY," ",self.ptView.frame.minY)
            self.lwButton.transform = CGAffineTransform(translationX: 16, y: self.ptView.frame.maxY - 130)
            
            let cgPointRecView = CGPoint(x: self.mnView.frame.minX, y: self.mnView.frame.maxY)
            self.lwButton.frame = CGRect(origin: cgPointRecView, size: CGSize(width: self.ptView.frame.width - 32, height: 80))
            
        self.lwButton.clipsToBounds = true
            
        
        self.ptView.addSubview(self.lwButton)
            
        
        
        
        
        })
        
        
        
        
        
        
    }
    


    @IBAction func onClickButton(_ sender: Any) {
        bottomView.isHidden = false
        bottomSheetButton.setTitle(" NEXT ", for: .normal)
        
        
        let animation = animationD(startPoint: NSNumber(value: 0), endPoint: NSNumber(value: 1), path: "transform.scale", duration: 2.0, animationType: .easeInEaseOut, isEndRequired: true)
        recView.layer.add(animation, forKey: "transform.scale")
        
        let animation2 = animationD(startPoint: NSNumber(value: Int(self.bottomSheetView.frame.width)), endPoint: 0, path: "position.x", duration: 2.0, animationType: .easeInEaseOut, isEndRequired: false)
        itemView.layer.add(animation2, forKey: "position.x")
        
        
    }
    

    @IBAction func onClickBottomSheetBtn(_ sender: Any) {
        
        
        if isClicked{
            readyToPlayView.isHidden = false
            itemView.isHidden = true
            recPtView.isHidden = true
            recView.isHidden = true
            rec2View.isHidden = false
            recPt2View.isHidden = true
            // for recview
            let animation5 = animationD(startPoint: NSNumber(value: 0), endPoint: NSNumber(value: 1), path: "transform.scale", duration: 2.0, animationType: .easeInEaseOut, isEndRequired: true)
            lbGameName.layer.add(animation5, forKey: "transform.scale")
            lbReadyToPlay.layer.add(animation5, forKey: "transform.scale")
            
            
            
            
            // for collection view
            let animation3 = animationD(startPoint: NSNumber(value: Int(self.bottomSheetView.frame.width)), endPoint: 0, path: "position.x", duration: 2.0, animationType: .easeInEaseOut, isEndRequired: false)
            self.collectionView.layer.add(animation3, forKey: "position.x")
            self.collectionView.reloadData()
            bottomSheetButton.setTitle("CONFIRM", for: .normal)
        }else{
            
            collectionStackView.isHidden = false
            itemView.isHidden = true
            rec2View.isHidden = false
            walletView.isHidden = false
            
            
            // for recview
            let animation4 = animationD(startPoint: NSNumber(value: 0), endPoint: NSNumber(value: 1), path: "transform.scale", duration: 2.0, animationType: .easeInEaseOut, isEndRequired: true)
            
            recView.layer.add(animation4, forKey: "transform.scale")
            
            
            // for collection view
            let animation3 = animationD(startPoint: NSNumber(value: Int(self.bottomSheetView.frame.width)), endPoint: 0, path: "position.x", duration: 2.0, animationType: .easeInEaseOut,isEndRequired:false)
                self.collectionView.layer.add(animation3, forKey: "position.x")
                self.collectionView.reloadData()
            isClicked = true
        }

        
        
    }
    
}
//MARK: CollectionView
extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        if indexPath.row == 0{
            cell.btn.backgroundColor = .green
        }else{
           cell.btn.backgroundColor = .lightGray
        }
        cell.btn.setTitle("\((indexPath.row + 1) * 5)", for: .normal)
        cell.btn.tintColor = .white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80.0, height: 80.0)
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
         return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
     }
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         return 32.0
     }
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
         return 0.0
     }
    
}

//MARK: Animation
extension ViewController{
    func animationD(startPoint:NSNumber,endPoint:NSNumber?,path:String,duration:Double,animationType:CAMediaTimingFunctionName,isEndRequired:Bool) -> CABasicAnimation{
        let positionAnimation = CABasicAnimation(keyPath: path)
        positionAnimation.duration = duration
        positionAnimation.fromValue = startPoint
        if isEndRequired{
           positionAnimation.toValue = isEndRequired
        }
        
        positionAnimation.timingFunction = CAMediaTimingFunction(name: animationType)
        return positionAnimation
    }
}

