//
//  TimerView.swift
//  GameLaunchTimer
//
//  Created by Gourav Nayyar on 7/3/14.
//  Copyright (c) 2014 Gourav Nayyar. All rights reserved.
//

let VIEW_ALPHA:CGFloat = 0.5
let TIMERVIEW_RADIUS:CGFloat = 50
let TIMER_LABEL_INITIAL_VAL:Int =  3
let BORDER_WIDTH:CGFloat = 2
var timerVal:Int = TIMER_LABEL_INITIAL_VAL;
var timer:NSTimer!


import UIKit
import QuartzCore

class TimerView :UIView {
  
  struct Stored {
    static var timerLbl:UILabel!
  }

  
  class func loadingCountDownTimerViewInView (_superView:UIView)-> TimerView
  {
    var timerView:TimerView = TimerView(frame:_superView.frame)
    timerView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(VIEW_ALPHA)
    _superView.addSubview(timerView)
    
    /* add a custom Circle view */
    
    let refFrame:CGRect = CGRectMake(_superView.center.x-TIMERVIEW_RADIUS, _superView.center.y-TIMERVIEW_RADIUS, 2*TIMERVIEW_RADIUS, 2*TIMERVIEW_RADIUS)
    var circleView:UIView = UIView(frame:refFrame)
    circleView.layer.cornerRadius = TIMERVIEW_RADIUS
    circleView.layer.borderColor = UIColor.whiteColor().CGColor
    circleView.layer.borderWidth = BORDER_WIDTH
    
    /* add a custom Label */
    
    Stored.timerLbl = UILabel(frame:circleView.bounds)
    Stored.timerLbl.text = "\(TIMER_LABEL_INITIAL_VAL)"
    Stored.timerLbl.textColor = UIColor.whiteColor()
    Stored.timerLbl.font = UIFont(name: "MarkerFelt-Thin", size: 40)
    Stored.timerLbl.textAlignment = NSTextAlignment.Center
    
    circleView.addSubview(Stored.timerLbl)
    timerView.addSubview(circleView)
    
    return timerView
  }
  
  func startTimer()
  {
    timer = NSTimer.scheduledTimerWithTimeInterval(1.0
      , target: self, selector: Selector("updateTimer:"), userInfo: nil, repeats: true)
  }
  
  func updateTimer(dt:NSTimer)
  {
    timerVal--
    if timerVal==0{
      Stored.timerLbl.text = "Go"
    }else if timerVal<0{
      timer.invalidate()
      removeCountDownTimerView()
    } else{
      Stored.timerLbl.text = "\(timerVal)"
    }
  }
  
  func removeCountDownTimerView()
  {
    var mySuperView:UIView = self.superview
    mySuperView.userInteractionEnabled = true
    super.removeFromSuperview()
  }
}
