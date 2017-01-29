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
var timer:Timer!


import UIKit
import QuartzCore
import AVFoundation

class TimerView :UIView {
  
    var audioPlayer : AVAudioPlayer = AVAudioPlayer()
 
    
    
  struct Stored {
    static var timerLbl:UILabel!
  }

  
  class func loadingCountDownTimerViewInView (_ _superView:UIView)-> TimerView
  {
    let timerView:TimerView = TimerView(frame:_superView.frame)
    timerView.backgroundColor = UIColor.black.withAlphaComponent(VIEW_ALPHA)
    _superView.addSubview(timerView)
    
    /* add a custom Circle view */
    
    let refFrame:CGRect = CGRect(x: _superView.center.x-TIMERVIEW_RADIUS, y: _superView.center.y-TIMERVIEW_RADIUS, width: 2*TIMERVIEW_RADIUS, height: 2*TIMERVIEW_RADIUS)
    let circleView:UIView = UIView(frame:refFrame)
    circleView.layer.cornerRadius = TIMERVIEW_RADIUS
    circleView.layer.borderColor = UIColor.white.cgColor
    circleView.layer.borderWidth = BORDER_WIDTH
    
    /* add a custom Label */
    
    Stored.timerLbl = UILabel(frame:circleView.bounds)
    Stored.timerLbl.text = "\(TIMER_LABEL_INITIAL_VAL)"
    Stored.timerLbl.textColor = UIColor.white
    Stored.timerLbl.font = UIFont(name: "MarkerFelt-Thin", size: 40)
    Stored.timerLbl.textAlignment = NSTextAlignment.center
    
    circleView.addSubview(Stored.timerLbl)
    timerView.addSubview(circleView)
    
    return timerView
  }
  
    func initiateSound() {
        let pathToFile = Bundle.main.path(forResource: "soundFile", ofType: "mp3")
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: pathToFile!) as URL)
        } catch {
            print("Failed to assign path to audio player.")
        }
    }
    
    func play() {
        audioPlayer.play()
    }
    
  func startTimer()
  {
    self.initiateSound()
    audioPlayer.play()
    timer = Timer.scheduledTimer(timeInterval: 1.0
      , target: self, selector: #selector(TimerView.updateTimer(_:)), userInfo: nil, repeats: true)
  }
  
  func updateTimer(_ dt:Timer)
  {
    audioPlayer.play()
    timerVal -= 1
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
    timerVal = TIMER_LABEL_INITIAL_VAL
    let mySuperView:UIView = self.superview!
    mySuperView.isUserInteractionEnabled = true
    super.removeFromSuperview()
  }
}
