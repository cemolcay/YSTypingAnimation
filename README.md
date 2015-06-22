YSTypingAnimation
=================

customisable *is typing* animation view written in swift.

Demo
----

![alt tag](https://raw.githubusercontent.com/cemolcay/YSTypingAnimation/master/demo.gif)

Usage
-----

Copy & paste `YSTypingAnimation.swift` into your project.

```
   let dots = YSTypingAnimation()
   dots.center = view.center
   view.addSubview(dots)
```

YSTypingAnimationAppearance
---------------------------

```
	struct YSTypingAnimationAppearance {
	    
	    var dotSize: CGFloat!
	    var dotSpacing: CGFloat!
	    var dotColor: UIColor!
	    var dotCount: Int!
	    var jumpHeight: CGFloat!
	    var jumpDuration: NSTimeInterval!
	    
	    init () {
	        dotSize = 15
	        dotSpacing = 5
	        dotColor = UIColor.blackColor()
	        dotCount = 3
	        jumpHeight = 5
	        jumpDuration = 0.35
	    }
	}
```
