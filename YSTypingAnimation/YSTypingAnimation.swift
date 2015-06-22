//
//  YSTypingAnimation.swift
//  
//
//  Created by Cem Olcay on 22/06/15.
//
//

import UIKit

struct YSTypingAnimationAppearance {
    
    var dotSize: CGFloat!
    var dotSpacing: CGFloat!
    var dotColor: UIColor!
    var dotCount: Int!
    var jumpHeight: CGFloat!
    var jumpDuration: NSTimeInterval!
    
    init () {
        dotSize = 30
        dotSpacing = 5
        dotColor = UIColor.blackColor()
        dotCount = 3
        jumpHeight = 10
        jumpDuration = 0.35
    }
}

class YSTypingAnimation: UIView {

    // MARK: Properties
    
    var appearance: YSTypingAnimationAppearance = YSTypingAnimationAppearance()
    var dots: [UIView] = []
    
    
    // MARK: Init
    
    init () {
        super.init(frame: CGRect(x: 0, y: 0, width: (CGFloat(appearance.dotCount) * appearance.dotSize) + (CGFloat(appearance.dotCount) * appearance.dotSpacing), height: appearance.dotSize + appearance.jumpHeight))
        
        var currentX: CGFloat = 0
        for i in 0..<appearance.dotCount {
            
            let dot = drawDot()
            addSubview(dot)
            dots.append(dot)
            dot.frame.origin.x = currentX
            currentX += appearance.dotSize + appearance.dotSpacing
        }
        
        startAnimating()
    }
    
    required init (coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    // MARK: Dot
    
    func drawDot () -> UIView {
        
        let dot = UIView (frame: CGRect(x: 0, y: 0, width: appearance.dotSize, height: appearance.dotSize))
        dot.backgroundColor = appearance.dotColor
        dot.layer.cornerRadius = appearance.dotSize/2
        
        return dot
    }
    
    
    // MARK: Animation
    
    var jumpAnim: CABasicAnimation {
        get {
            let anim = CABasicAnimation(keyPath: "position.y")
            anim.fromValue = appearance.dotSize/2
            anim.toValue = appearance.jumpHeight
            anim.duration = appearance.jumpDuration
            anim.repeatCount = Float.infinity
            anim.autoreverses = true
            
            return anim
        }
    }
    
    func startAnimating () {
        
        var del: NSTimeInterval = 0
        
        for dot in dots {
            delay(del, queue: dispatch_get_main_queue(), after: { () -> Void in
                dot.layer.addAnimation(self.jumpAnim, forKey: "jump")
            })
            
            del += appearance.jumpDuration / NSTimeInterval(appearance.jumpHeight) * NSTimeInterval(appearance.dotCount) * 2
        }
    }
    
    
    // MARK: Helpers
    
    func delay (
        seconds: Double,
        queue: dispatch_queue_t = dispatch_get_main_queue(),
        after: () -> Void) {
            
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(seconds * Double(NSEC_PER_SEC)))
            dispatch_after(time, queue, after)
    }
    
}
