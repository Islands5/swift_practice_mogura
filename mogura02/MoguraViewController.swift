//
//  MoguraViewController.swift
//  mogura02
//
//  Created by 五島　僚太郎 on 2015/11/01.
//  Copyright © 2015年 rg. All rights reserved.
//

import UIKit

class MoguraViewController: UIViewController {

    var timer: NSTimer!
    var moguraMatrix = Array<[Mogura]>(count: 3, repeatedValue: [Mogura](count: 3, repeatedValue: Mogura()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let syogaibutu = UIImage(named: "morituti.png")
        
        let windowSize = UIScreen.mainScreen().bounds.size
        let moritutiArea = UIImageView(frame: CGRectMake(0, 50, windowSize.width, windowSize.height - 100.0))
        moritutiArea.image = syogaibutu
        self.view.backgroundColor = UIColor.greenColor()
        
        for var i = 0; i < 3;i++ {
            for var j = 0; j < 3; j++ {
                moguraMatrix[i][j].beforeCenter = CGPoint(x: 35.0 + CGFloat(100 * j),y: CGFloat(50 + 130 * i))
                moguraMatrix[i][j].setPosition()
            }
        }
        
        for var i = 0; i < 3;i++ {
            for var j = 0; j < 3; j++ {
                self.view.addSubview(moguraMatrix[i][j])
            }
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("movingMoguras:"), userInfo: nil, repeats: true)
        
        self.view.addSubview(moritutiArea)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func movingMoguras(timer : NSTimer) {
        var x = Int(arc4random_uniform(3))
        var y = Int(arc4random_uniform(3))
        moguraMatrix[x][y].moving()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
