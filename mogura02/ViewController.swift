//
//  ViewController.swift
//  mogura02
//
//  Created by 五島　僚太郎 on 2015/10/28.
//  Copyright © 2015年 rg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer: NSTimer!
    var moguraMatrix:[[UIImageView]] =
        [
            [UIImageView(), UIImageView(), UIImageView()],
            [UIImageView(), UIImageView(), UIImageView()],
            [UIImageView(), UIImageView(), UIImageView()]
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let syogaibutu = UIImage(named: "morituti.png")
        let windowSize = UIScreen.mainScreen().bounds.size

        
        let moritutiArea = UIImageView(frame: CGRectMake(0, 50, windowSize.width, windowSize.height - 100.0))
        moritutiArea.image = syogaibutu
        
        self.view.backgroundColor = UIColor.greenColor()
        
        for var i = 0; i < 3;i++ {
            for var j = 0; j < 3; j++ {
                moguraMatrix[i][j] = moguraView(35.0 + CGFloat(100 * j),y: CGFloat(50 + 130 * i))
            }
        }
        
        for var i = 0; i < 3;i++ {
            for var j = 0; j < 3; j++ {
                self.view.addSubview(moguraMatrix[i][j])
            }
        }
        
        self.view.addSubview(moritutiArea)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "animationMogura:", userInfo: nil, repeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func moguraView(x:CGFloat, y:CGFloat) -> UIImageView {
        let moguraImg = UIImage(named: "mogura@2x.png")
        let moguraArea = UIImageView(frame: CGRectMake(x, y, 53.0, 53.0))
        let beforeCenter = moguraArea.center
        let afterCenter = CGPoint(x: beforeCenter.x, y:beforeCenter.y - 30)
        
        moguraArea.image = moguraImg
        UIView.animateWithDuration(0.5,
            animations: { () -> Void in
                moguraArea.center = afterCenter
            }) { (Bool) -> Void in
                UIView.animateWithDuration(0.5,
                    animations: { () -> Void in
                        moguraArea.center = beforeCenter
                    }) { (Bool) -> Void in
                }
        }
        return moguraArea
    }
    
    func animationMogura(timer: NSTimer) {
        print("hello")
    }

}

