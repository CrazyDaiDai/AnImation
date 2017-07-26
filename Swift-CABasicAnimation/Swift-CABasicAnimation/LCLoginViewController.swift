//
//  LCLoginViewController.swift
//  Swift-CABasicAnimation
//
//  Created by 呆仔～林枫 on 2017/7/26.
//  Copyright © 2017年 Lin_Crazy. All rights reserved.
//

import UIKit

class LCLoginViewController: UIViewController {

    @IBOutlet weak var imageTop: NSLayoutConstraint!//图片顶部的约束
    
    @IBOutlet weak var oneCenter: NSLayoutConstraint!//第一个按钮的中线约束
   
    @IBOutlet weak var twoCenter: NSLayoutConstraint!//第二个按钮的中线约束
    
    @IBOutlet weak var threeCenter: NSLayoutConstraint!//第三个按钮的中心约束
    
    @IBOutlet weak var iconImageView: UIImageView! //图片
    @IBOutlet weak var oneBtn: UIButton!//按钮1
    @IBOutlet weak var twoBtn: UIButton!//按钮2
    @IBOutlet weak var threeBtn: UIButton!//按钮3
    
    let screenW = UIScreen.main.bounds.width
    let screenH = UIScreen.main.bounds.height
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        imageTop.constant -= iconImageView.bounds.size.height + 30
        oneBtn.alpha = 0
        oneCenter.constant -= screenW
        twoCenter.constant += screenW
        threeCenter.constant += screenH
        label.alpha = 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let imageW : CGFloat = screenW * 0.5
//        let file = Bundle.main.path(forResource: "icon", ofType: "png")
//        let image = UIImage.init(contentsOfFile: file!)
//        
//        let imageLayer = CALayer()
//        imageLayer.position = .init(x: screenW / 2 , y: 100 + imageW * 0.5)
//        imageLayer.bounds = .init(x: 0, y: 0, width: imageW, height: imageW)
//        imageLayer.contents = image?.cgImage
//        view.layer.addSublayer(imageLayer)
        
        //圆角
        oneBtn.layer.cornerRadius = 5
        twoBtn.layer.cornerRadius = 5
        threeBtn.layer.cornerRadius = 5
                
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        label.alpha = 0
//        image
        UIView.animate(withDuration: 2.4, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .layoutSubviews, animations: {
            self.imageTop.constant = 30
            self.view.layoutIfNeeded()
        }, completion: nil)
//        Btn
        oneBtn.alpha = 1
        UIView.animate(withDuration: 2, delay: 1, usingSpringWithDamping: 0.3, initialSpringVelocity: 5, options: .layoutSubviews, animations: {
            self.oneCenter.constant += self.screenW
            self.twoCenter.constant -= self.screenW
            self.threeCenter.constant -= self.screenH
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    lazy var label : UILabel = {
    
        let label = UILabel.init()
        label.frame = .init(x: 0, y: 300, width: 414, height: 21)
        label.textColor = .green
        label.text = "点击屏幕有惊喜"
        label.textAlignment = .center
        self.view.addSubview(label)
        return label
    }()

}
