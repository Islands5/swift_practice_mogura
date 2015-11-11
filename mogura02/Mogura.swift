//
//  Mogura.swift
//  mogura02
//
//  Created by 五島　僚太郎 on 2015/11/01.
//  Copyright © 2015年 rg. All rights reserved.
//

import UIKit

class Mogura: UIView {
    
    var beforeCenter: CGPoint
    var afterCenter: CGPoint
    let moguraImg: UIImage
    var state = false
    
    init() {
        self.beforeCenter = CGPoint()
        self.afterCenter = CGPoint()
        self.moguraImg = UIImage(named: "mogura@2x.png")!
        super.init(frame: CGRectZero)
        self.userInteractionEnabled = false
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    func setPosition() {
        let moguraArea = UIImageView(frame: CGRectMake(0, 0, 53.0, 53.0))
        moguraArea.image = moguraImg
        self.frame = CGRectMake(self.beforeCenter.x, self.beforeCenter.y, 53.0, 53.0)
        beforeCenter = self.center
        afterCenter = CGPoint(x: self.beforeCenter.x, y: self.beforeCenter.y - 30.0)
        
        self.addSubview(moguraArea)
    }

    func moving() {
        UIView.animateWithDuration(1.0,
            animations: { () -> Void in
                self.center = self.afterCenter
                self.state = true
            }) { (Bool) -> Void in
                UIView.animateWithDuration(0.4,
                    animations: { () -> Void in
                        self.center = self.beforeCenter
                    }) { (Bool) -> Void in
                        self.state = false
                }
        }
    }
    
    func moveOut() {
        UIView.animateWithDuration(0.5,
            animations: { () -> Void in
                self.center = CGPoint(x: self.center.x, y: self.center.y - 100)
                self.alpha = 0.0
                self.transform = CGAffineTransformMakeScale(2, 2)
            }) { (Bool) -> Void in
                UIView.animateWithDuration(0.3,
                    animations: { () -> Void in
                        self.center = self.beforeCenter
                        self.alpha = 0.0
                    }) { (Bool) -> Void in
                        self.alpha = 1.0
                        self.transform = CGAffineTransformMakeScale(1, 1)
                }
        }
    }
    
    func isAttacked(location: CGPoint) -> Bool {
        let distance = sqrt(pow(self.center.x - location.x, 2) + pow(self.center.y - location.y, 2))
        if 53.0 > distance && self.state == true {
            return true
        }else {
            return false
        }
    }
}
