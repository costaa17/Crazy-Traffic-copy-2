//
//  GameOver.swift
//  Crazy Traffic copy 2
//
//  Created by Ana Vitoria do Valle Costa on 4/2/16.
//  Copyright © 2016 Ana Vitoria do Valle Costa. All rights reserved.
//

import Foundation
import SpriteKit

class GameOver: SKScene {
    
    override func didMoveToView(view: SKView) {
        self.backgroundColor = UIColor.blackColor()
        DrawNodes.drawGameOverLabel(self)
    }
}