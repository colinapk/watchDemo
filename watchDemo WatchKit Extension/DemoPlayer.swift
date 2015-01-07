//
//  DemoPlayer.swift
//  watchDemo
//
//  Created by Colin on 15/1/6.
//  Copyright (c) 2015年 colin. All rights reserved.
//

import UIKit
import AVFoundation

private var _instance = DemoPlayer()

class DemoPlayer: NSObject ,AVAudioPlayerDelegate {
    private var myPlayer:AVAudioPlayer?
    private var curSongIndex = 1
    
    private let audioFiles = ["你是我心爱的姑娘_汪峰","Where Are We Now?_David","Just One Last Dance"]
    private let covers = ["wangfeng","david","sarah"]
    
    class func shareInstance()->DemoPlayer{
        return _instance
    }
    func curSongCover()->UIImage{
        let imageName = covers[curSongIndex]
        let imagePath = NSBundle.mainBundle().pathForResource(imageName, ofType: "png")
        let image = UIImage(contentsOfFile: imagePath!)
        return image!
    }
    func curSongTitle()->NSString{
        return audioFiles[curSongIndex]
    }
    func playCurSong(){
        myPlayer = self.loadSound(audioFiles[curSongIndex])
        myPlayer?.delegate = self
        myPlayer!.play()
    }
    func playNextSong(){
        changeCurSongIndex()
        playCurSong()
    }
    func stop(){
        myPlayer?.stop()
    }
    private func changeCurSongIndex(){
        if(++curSongIndex > 2){
            curSongIndex = 0
        }
    }
    private func loadSound(filename:NSString) -> AVAudioPlayer {
        let url = NSBundle.mainBundle().URLForResource(filename, withExtension: "mp3")
        var error:NSError? = nil
        let player = AVAudioPlayer(contentsOfURL: url, error: &error)
        player.prepareToPlay()
        return player
    }
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer!, successfully flag: Bool) {
        
    }
    
   
}
