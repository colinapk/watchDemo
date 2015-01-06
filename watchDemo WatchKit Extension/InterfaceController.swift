//
//  InterfaceController.swift
//  watchDemo WatchKit Extension
//
//  Created by Colin on 15/1/5.
//  Copyright (c) 2015年 colin. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var songCover: WKInterfaceImage!
    var curSongIndex = 0
    let audioFiles = ["你是我心爱的姑娘_汪峰.mp3","Where Are We Now?_David.mp3","Just One Last Dance.mp3"]
    let covers = ["wangfeng","david","sarah"]
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func onButtonClicked() {
        changeCurSong()
        let imageName = covers[curSongIndex]
        
        self.songCover.setImageNamed(imageName)
        
    }
    func changeCurSong(){
        
        if(++curSongIndex > 2){
            curSongIndex = 0
        }
    }
}
