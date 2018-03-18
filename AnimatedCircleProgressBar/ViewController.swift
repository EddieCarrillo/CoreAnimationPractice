//
//  ViewController.swift
//  AnimatedCircleProgressBar
//
//  Created by Eduardo Carrillo on 3/17/18.
//  Copyright © 2018 Eduardo Carrillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let shapeLayer = CAShapeLayer()
        
        let center = view.center
        let radius = 100
        let startAngle = 0
        let endAngle = 2*CGFloat.pi
        let isClockwise = true
        
        let circularPath  = UIBezierPath(arcCenter: center, radius: CGFloat(radius), startAngle: CGFloat(startAngle), endAngle: endAngle, clockwise: isClockwise)
        
        shapeLayer.path = circularPath.cgPath
        
        view.layer.addSublayer(shapeLayer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

