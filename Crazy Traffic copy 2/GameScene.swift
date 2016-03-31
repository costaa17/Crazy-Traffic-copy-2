//
//  GameScene.swift
//  Crazy Traffic copy 2
//
//  Created by Ana Vitoria do Valle Costa on 3/27/16.
//  Copyright (c) 2016 Ana Vitoria do Valle Costa. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        self.backgroundColor = UIColor.blackColor()
        //DrawNodes.drawPlayButton(self, big: true)
        DrawNodes.drawPaths(self)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        let touch = touches.first
        let touchLocation = touch!.locationInNode(self)
        let nodes = self.nodesAtPoint(touchLocation)
        for node in nodes {
            if node.name == "playButton" {
                // go to Map
                let scene = MapScene()
                let skView = self.view as SKView!
                skView.ignoresSiblingOrder = true
                scene.scaleMode = .ResizeFill
                scene.size = (size: skView.bounds.size)
                skView.presentScene(scene)
            }
        }

    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
