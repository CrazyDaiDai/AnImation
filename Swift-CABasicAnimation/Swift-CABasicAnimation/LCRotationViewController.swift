//
//  LCRotationViewController.swift
//  Swift-CABasicAnimation
//
//  Created by 呆仔～林枫 on 2017/7/25.
//  Copyright © 2017年 Lin_Crazy. All rights reserved.
//

import UIKit

class LCRotationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //缩放
        redLeftLayer.add(setLayerAnimation(keyPath: "transform.scale.x",toValue: 0.1), forKey: nil)
        grayLeftLayer.add(setLayerAnimation(keyPath: "transform.scale.y",toValue: 0.1), forKey: nil)
        blueLeftLayer.add(setLayerAnimation(keyPath: "transform.scale.z",toValue: 0.1), forKey: nil)
        greenLayer.add(setLayerAnimation(keyPath: "transform.scale",toValue: 0.1), forKey: nil)
        //旋转
        redRightLayer.add(setLayerAnimation(keyPath: "transform.rotation.x", toValue: .pi), forKey: nil)
        grayRightLayer.add(setLayerAnimation(keyPath: "transform.rotation.y", toValue: .pi), forKey: nil)
        blueRightLayer.add(setLayerAnimation(keyPath: "transform.rotation.z", toValue: .pi), forKey: nil)
        greenRightLayer.add(setLayerAnimation(keyPath: "transform.rotation", toValue: -.pi), forKey: nil)
    }
    
    
// 懒加载Layer
    lazy var redLeftLayer : CALayer = {
     
        return self.setLayer(position: .init(x: 100, y: 130), backColor: .red)
    }()
    lazy var redRightLayer : CALayer =  {
    
        return self.setLayer(position: .init(x: 260, y: 130), backColor: .red)
    }()
    lazy var grayLeftLayer : CALayer = {
    
        return self.setLayer(position: .init(x: 100, y: 260), backColor: .gray)
    }()
    lazy var grayRightLayer : CALayer = {
    
        return self.setLayer(position: .init(x: 260, y: 260), backColor: .gray)
    }()
    lazy var blueLeftLayer : CALayer = {
    
        return self.setLayer(position: .init(x: 100, y: 390), backColor: .blue)
    }()
    lazy var blueRightLayer : CALayer = {
        
        return self.setLayer(position: .init(x: 260, y: 390), backColor: .blue)
    }()
    lazy var greenLayer : CALayer = {
    
        return self.setLayer(position: .init(x: 100, y: 520), backColor: .green)
    }()
    lazy var greenRightLayer : CALayer = {
        
        return self.setLayer(position: .init(x: 260, y: 520), backColor: .green)
    }()
    
    func setLayer(position : CGPoint,backColor : UIColor) -> CALayer {
        
        let layer = CALayer()
        layer.position = position
        layer.backgroundColor = backColor.cgColor
        layer.bounds = .init(x: 0, y: 0, width: 100, height: 100)
        view.layer.addSublayer(layer)
        return layer
    }
    
    func setLayerAnimation(keyPath : String,toValue : CGFloat) -> CAAnimation {
        
        let layerAnimation = CABasicAnimation()
        layerAnimation.keyPath = keyPath
        layerAnimation.toValue = toValue
        layerAnimation.duration = 2
        layerAnimation.repeatCount = .greatestFiniteMagnitude
        return layerAnimation
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
