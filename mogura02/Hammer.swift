//
//  Hammer.swift
//  mogura02
//
//  Created by 五島　僚太郎 on 2015/11/03.
//  Copyright © 2015年 rg. All rights reserved.
//

import UIKit

class Hammer: UIView {

    init() {
        super.init(frame: CGRectZero)
        let hammerImg = UIImage(named: "picopicohammer@2x.png")!
        let hammerView = UIImageView(frame: CGRectMake(0, 0, 50.0, 80.0))
        hammerView.image = hammerImg
        self.addSubview(hammerView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func move(x: CGFloat, y: CGFloat) {
        self.center = CGPoint(x: x, y: y)
        UIView.animateWithDuration(0.2,
            animations: { () -> Void in
                self.transform = CGAffineTransformMakeRotation(-90)
            }) { (Bool) -> Void in
                UIView.animateWithDuration(0.2,
                    animations: { () -> Void in
                        self.transform = CGAffineTransformMakeRotation(0)
                    }) { (Bool) -> Void in
                }
        }
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
