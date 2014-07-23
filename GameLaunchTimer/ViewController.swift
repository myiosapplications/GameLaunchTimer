//
//  ViewController.swift
//  GameLaunchTimer
//
//  Created by Gourav Nayyar on 7/3/14.
//  Copyright (c) 2014 Gourav Nayyar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    /* load a count down view */
    var gamelaunchTimerView:TimerView = TimerView.loadingCountDownTimerViewInView(self.view)
    gamelaunchTimerView.startTimer()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

