//
//  InterfaceController.swift
//  watchDemo WatchKit Extension
//
//  Created by Colin on 15/1/5.
//  Copyright (c) 2015年 colin. All rights reserved.
//

import WatchKit
import Foundation
import AVFoundation

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var songCover: WKInterfaceImage!
    var myPlayer:AVAudioPlayer?
    
    var curSongIndex = 1
    let audioFiles = ["你是我心爱的姑娘_汪峰","Where Are We Now?_David","Just One Last Dance"]
    let covers = ["wangfeng","david","sarah"]
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        playCurSong()
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        myPlayer!.stop()
        
    }

    @IBAction func onButtonClicked() {
        changeCurSong()
        playCurSong()
        
    }
    func playCurSong(){
        let imageName = covers[curSongIndex]
        let imagePath = NSBundle.mainBundle().pathForResource(imageName, ofType: "png")
        let image = UIImage(contentsOfFile: imagePath!)
        
        self.songCover.setImage(image)
        
        myPlayer = self.loadSound(audioFiles[curSongIndex])
        myPlayer!.play()
    }
    func changeCurSong(){
        
        if(++curSongIndex > 2){
            curSongIndex = 0
        }
    }
    func loadSound(filename:NSString) -> AVAudioPlayer {
        let url = NSBundle.mainBundle().URLForResource(filename, withExtension: "mp3")
        var error:NSError? = nil
        let player = AVAudioPlayer(contentsOfURL: url, error: &error)
        player.prepareToPlay()
        return player
    }
}
