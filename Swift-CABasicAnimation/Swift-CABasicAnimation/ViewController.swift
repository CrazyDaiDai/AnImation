//
//  ViewController.swift
//  Swift-CABasicAnimation
//
//  Created by 呆仔～林枫 on 2017/7/25.
//  Copyright © 2017年 Lin_Crazy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         public let kCAMediaTimingFunctionLinear: String
         public let kCAMediaTimingFunctionEaseIn: String
         public let kCAMediaTimingFunctionEaseOut: String
         public let kCAMediaTimingFunctionEaseInEaseOut: String
         public let kCAMediaTimingFunctionDefault: String
         */
        redLayer.add(createBasicAnimation(fromeValue: redLayer.position, toValue: .init(x: 300, y: 130), timingFunction: kCAMediaTimingFunctionLinear), forKey: "linear")
        greenLayer.add(createBasicAnimation(fromeValue: greenLayer.position, toValue: .init(x: 300, y: 250), timingFunction: kCAMediaTimingFunctionEaseIn), forKey: "linear")
        blueLayer.add(createBasicAnimation(fromeValue: blueLayer.position, toValue: .init(x: 300, y: 370), timingFunction: kCAMediaTimingFunctionEaseOut), forKey: "linear")
        grayLayer.add(createBasicAnimation(fromeValue: grayLayer.position, toValue: .init(x: 300, y: 490), timingFunction: kCAMediaTimingFunctionEaseInEaseOut), forKey: "linear")
    }

// 平移
    func createBasicAnimation(fromeValue : CGPoint,toValue : CGPoint,timingFunction : String) -> CABasicAnimation {
        
        let basicAnimation = CABasicAnimation()
        basicAnimation.fromValue = fromeValue
        basicAnimation.toValue = toValue
        basicAnimation.timingFunction = CAMediaTimingFunction.init(name: timingFunction)
        basicAnimation.keyPath = "position"
        basicAnimation.duration = 3.0
        basicAnimation.repeatCount = .greatestFiniteMagnitude
        return basicAnimation
    }
    
// UI
    lazy var redLayer : CALayer = {

        return self.setLayer(position: .init(x: 50, y: 130), backColor: .red)
    }()
    
    lazy var greenLayer : CALayer = {
    
        return self.setLayer(position: .init(x: 50, y: 250), backColor: .green)
    }()
    
    lazy var blueLayer : CALayer = {
    
        return self.setLayer(position: .init(x: 50, y: 370), backColor: .blue)
    }()
    
    lazy var grayLayer : CALayer = {
    
        return self.setLayer(position: .init(x: 50, y: 490), backColor: .gray)
    }()
    
    func setLayer(position : CGPoint,backColor : UIColor) -> CALayer {
        
        let layer = CALayer()
        layer.position = position
        layer.bounds = .init(x: 0, y: 0, width: 100, height: 100)
        layer.backgroundColor = backColor.cgColor
        view.layer.addSublayer(layer)
        return layer
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

