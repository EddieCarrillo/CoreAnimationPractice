//
//  ViewController.swift
//  AnimatedCircleProgressBar
//
//  Created by Eduardo Carrillo on 3/17/18.
//  Copyright © 2018 Eduardo Carrillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    
    
    
    let shapeLayer = CAShapeLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let center = view.center
        let radius = 100
        let startAngle = 0
        let endAngle = 2*CGFloat.pi
        let isClockwise = true
        
        let circularPath  = UIBezierPath(arcCenter: center, radius: CGFloat(radius), startAngle: CGFloat(startAngle), endAngle: endAngle, clockwise: isClockwise)
        
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.strokeEnd = 0
        
        view.layer.addSublayer(shapeLayer)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
        view.isUserInteractionEnabled = true
        
    }

    
    @objc private func didTap(){
        print("[didtap()]")
        let strokeEndProperty = "strokeEnd"
        let basicAnimationKey = "basicStrokeAnimation"
        
        //When user taps we should animate the stroke
        let basicAnimation = CABasicAnimation(keyPath: strokeEndProperty)
        basicAnimation.toValue = 1.0
        
        shapeLayer.add(basicAnimation, forKey: basicAnimationKey)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

