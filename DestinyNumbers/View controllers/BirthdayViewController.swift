//
//  BirthdayViewController.swift
//  DestinyNumbers
//
//  Created by Kyle Lei on 2021/11/30.
//

import UIKit

class BirthdayViewController: UIViewController {
    

    let contentWidth = Dimension().width
    let mainPadding = Dimension().defaultPadding
    let buttonY = Dimension().buttonY
    let buttonHeight = Dimension().buttonHeight
    
    let titleLabel = UILabel()
    let datePicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.addSublayer(petalPattern(width: Dimension().screenWidth, height: Dimension().screenHeight, numOfPetal: 64, widthOfPatal: 200, positionY: -220))
        
        titleLabel.frame = CGRect(x: mainPadding, y: 180, width: contentWidth, height: 32)
        titleLabel.text = "Select Birthday"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textColor = .white
        view.addSubview(titleLabel)
        
        
        datePicker.frame = CGRect(x: mainPadding, y: 320, width: contentWidth, height: contentWidth)
        datePicker.preferredDatePickerStyle = .inline
        datePicker.datePickerMode = .date
        datePicker.overrideUserInterfaceStyle = .dark
        datePicker.tintColor = .cyan
        view.addSubview(datePicker)        

    }
    
    @IBSegueAction func showResult(_ coder: NSCoder, sender: Any?) -> ResultViewController? {
        ResultViewController(coder: coder, birthday: datePicker.date)
      
    }
    
    //
    func petalPattern (width: CGFloat, height: CGFloat, numOfPetal: CGFloat, widthOfPatal: CGFloat, positionY: CGFloat) -> CAShapeLayer {
        let petalLayer = CAShapeLayer()
        petalLayer.frame = CGRect(x: 0, y: 0, width: width, height: height)
        let path = CGMutablePath()
        
        for angle in stride(from: 0, to: CGFloat.pi * 2, by: CGFloat.pi * 2 / numOfPetal) {
            var transfom = CGAffineTransform(rotationAngle: angle)
                .concatenating(CGAffineTransform(translationX: width / 2, y: height / 2))
            let petal = CGPath(ellipseIn: CGRect(x: -(widthOfPatal/2), y: 0, width: widthOfPatal, height: 150), transform: &transfom)
            path.addPath(petal)
        }
                
        petalLayer.path = path
        petalLayer.strokeColor = UIColor.black.cgColor
        petalLayer.lineWidth = 2
        petalLayer.fillColor  = UIColor.cyan.cgColor
        petalLayer.opacity = 0.87
        petalLayer.fillRule = .evenOdd
        petalLayer.add(animation(), forKey: nil)
        
        var transform = CATransform3DIdentity
        transform.m44 =  -1 / 100
        petalLayer.transform = CATransform3DTranslate(transform, 0, positionY, 0)
        
        return petalLayer
    }
    
    func animation() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.duration = 10
        animation.fromValue = 0
        animation.toValue = 3
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        animation.repeatCount = .greatestFiniteMagnitude
        
        return animation
    }


}


