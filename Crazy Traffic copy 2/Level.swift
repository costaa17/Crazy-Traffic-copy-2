//
//  Level.swift
//  Crazy Traffic copy 2
//
//  Created by Ana Vitoria do Valle Costa on 3/27/16.
//  Copyright © 2016 Ana Vitoria do Valle Costa. All rights reserved.
//

import Foundation
import SpriteKit

class Level: SKScene, SKPhysicsContactDelegate{
    func gameOver(){
        // update high score
        
        
        
        
        // set game over scene
        let scene = GameOver()
        let skView = self.view as SKView!
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .ResizeFill
        scene.size = (size: skView.bounds.size)
        skView.presentScene(scene)
    }
    
    override func update(currentTime: NSTimeInterval) {
        TrainRunner.runTrains(self)
    }
    
    override func didMoveToView(view: SKView) {
        DrawNodes.drawPaths(self)
        self.backgroundColor = UIColor.blackColor()
        
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVectorMake(0, 0)
        
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        if ContactTypeTest.contactTypeTest(contact) == ContactType.crash{
            gameOver()
        }
    }
    
    
    
}