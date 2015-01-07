//
//  GlanceController.swift
//  watchDemo WatchKit Extension
//
//  Created by Colin on 15/1/5.
//  Copyright (c) 2015年 colin. All rights reserved.
//

import WatchKit
import Foundation


class GlanceController: WKInterfaceController {

    @IBOutlet weak var labelSongName: WKInterfaceLabel!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        self.labelSongName.setText(DemoPlayer.shareInstance().curSongTitle())
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
