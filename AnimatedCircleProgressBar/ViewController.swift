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
        let startAngle = -1*CGFloat.pi/2
        let endAngle = 3*CGFloat.pi/2
        let isClockwise = true
        
        
        
        let circularPath  = UIBezierPath(arcCenter: center, radius: CGFloat(radius), startAngle: CGFloat(startAngle), endAngle: endAngle, clockwise: isClockwise)
        
        
        let trackLayer = CAShapeLayer()
        
        trackLayer.path = circularPath.cgPath
        //Rounder line
        trackLayer.lineCap = kCALineCapRound
        trackLayer.fillColor = UIColor.clear.cgColor
        
        trackLayer.strokeColor = UIColor.gray.cgColor
        trackLayer.lineWidth = 10
        
        view.layer.addSublayer(trackLayer)
        
        shapeLayer.path = circularPath.cgPath
        //Rounder line
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.fillColor = UIColor.clear.cgColor
        
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
        
        basicAnimation.duration = 2
       basicAnimation.isRemovedOnCompletion = false
        basicAnimation.fillMode = kCAFillModeForwards
        
        shapeLayer.add(basicAnimation, forKey: basicAnimationKey)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

